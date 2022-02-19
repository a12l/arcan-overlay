{ stdenv, lib, fetchFromGitHub, makeDesktopItem, copyDesktopItems, runtimeShell
, bash, arcan, makeWrapper, withXarcan ? true, xarcan }:

stdenv.mkDerivation rec {
  pname = "durden";
  version = "0.6.1+unstable=2022-01-30";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "117f4f8c0f694ea6fc9862bcfda5a652591b1106";
    sha256 = lib.fakeSha256;
  };

  buildInputs = [ arcan makeWrapper ] ++ lib.optionals withXarcan [ xarcan ];

  nativeBuildInputs = [ copyDesktopItems ];

  desktopItem = makeDesktopItem {
    name = pname;
    desktopName = "Durden";
    exec = pname;
    comment = "Desktop environment for Arcan";
    type = "Application";
    terminal = "false";
  };

  installPhase = ''
    runHook preInstall

    mkdir --parents $out/bin $out/share/${pname}

    # Copy appl's source
    cp --recursive ./durden/* $out/share/${pname}/

    # Add command
    echo "#!${runtimeShell}

    exec arcan $out/share/${pname}" > $out/bin/${pname}
    chmod +x $out/bin/${pname}

    runHook postInstall
  '';

  postInstall = ''
    wrapProgram $out/bin/${pname} --prefix PATH : ${lib.makeBinPath [ arcan ]}
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
