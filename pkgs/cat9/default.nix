{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "cat9";
  version = "0.6.1+unstable=2022-10-31";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "cde776e2ba833fc9847087a83f853396d5dd73d9";
    sha256 = "0lxfjwdlvjzdyah3p9qcz4cspq4bm38jd4mc6rjn4aa1457m8q96";
  };

  installPhase = ''
    runHook preInstall

    mkdir --parents ${placeholder "out"}/share/arcan/appl/${pname}/
    cp --archive ./${pname}.lua ${placeholder "out"}/share/arcan/appl/${pname}/
    cp --archive ./${pname} ${placeholder "out"}/share/arcan/appl/${pname}/

    runHook postInstall
  '';

  meta = with lib; {
    description = "";
    homepage = "https://github.com/letoram/cat9";
    changelog = "https://github.com/letoram/cat9/releases/tag/${version}";
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
