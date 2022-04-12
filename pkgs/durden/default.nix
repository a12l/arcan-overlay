{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "durden";
  version = "0.6.1+unstable=2022-04-01";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "21d5fb888db8acb30d9562519a3e10bc255e6897";
    sha256 = "sha256-Au+FUUhUkF+qR1jdGdt2VfP+By6W47fNriXzVKnaG3g=";
  };

  installPhase = ''
    runHook preInstall

    mkdir --parents ${placeholder "out"}/share/arcan/appl/
    cp -a ./${pname} ${placeholder "out"}/share/arcan/appl/

    runHook postInstall
  '';

  meta = with lib; {
    description = "A desktop environment for the Arcan Display Server";
    homepage = "https://github.com/letoram/durden";
    changelog = "https://github.com/letoram/durden/releases/tag/${version}";
    license = licenses.bsd3;
    platforms = platforms.all;
  };
}
