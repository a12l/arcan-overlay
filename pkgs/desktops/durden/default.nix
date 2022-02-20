{ stdenv, lib, fetchFromGitHub, runtimeShell
, bash, arcan, makeWrapper, withXarcan ? true, xarcan }:

stdenv.mkDerivation rec {
  pname = "durden";
  version = "0.6.1+unstable=2022-01-30";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "117f4f8c0f694ea6fc9862bcfda5a652591b1106";
    sha256 = "sha256-x8Ewx5gtRP9a0nd+TchoA0b9FfT1+W20Fbq0bf87Y2k=";
  };

  buildInputs = [ arcan makeWrapper ] ++ lib.optionals withXarcan [ xarcan ];

  installPhase = ''
    runHook preInstall

    mkdir --parents ${placeholder "out"}/share/arcan/appl/
    cp -a ./${pname} ${placeholder "out"}/share/arcan/appl/

    runHook postInstall
  '';

  postInstall = ''
    wrapProgram $out/bin/${pname}
      --prefix PATH ":" "${placeholder "out"}/bin" \
      --set ARCAN_APPLBASEPATH "${placeholder "out"}/share/arcan/appl/" \
      --set ARCAN_BINPATH "${placeholder "out"}/bin/arcan_frameserver" \
      --set ARCAN_LIBPATH "${placeholder "out"}/lib/" \
      --set ARCAN_RESOURCEPATH "${placeholder "out"}/share/arcan/resources/" \
      --set ARCAN_SCRIPTPATH "${placeholder "out"}/share/arcan/scripts/"
  '';

  meta = with lib; {
    description = "A desktop environment for the Arcan Display Server";
    homepage = "https://github.com/letoram/durden";
    changelog = "https://github.com/letoram/durden/releases/tag/${version}";
    license = licenses.bsd3;
    platforms = platforms.all;
    maintainers = with maintainers; [ a12l ];
  };
}
