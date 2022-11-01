{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "cat9";
  version = "0.6.1+unstable=2022-08-28";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "a2d7478940458e9c7738dce2ae660f96880b3e66";
    sha256 = "0x74hgdwhn5x4ll2nkv4dg4ibq9fw82wp11va58yvcpa2jgry54x";
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
