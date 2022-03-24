{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "durden";
  version = "0.6.1+unstable=2022-03-11";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "fec2a1051500df28becce188d932645743091efa";
    sha256 = "sha256-uZ7oTnkWG3P/4ETgn6MQ9v47mRAJnvyzglQS7jlabPA=";
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
