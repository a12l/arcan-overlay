{ stdenv, lib, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "pipeworld";
  version = "0.0.0+unstable=2021-12-03";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "990e578739ab86aeac23f3d14bc9d2b7a36a9736";
    sha256 = "sha256-iEjtwKzN8qrJAbEJYmFTp3hmZesbTMBcUVOGbZpGjq4=";
  };

  installPhase = ''
    runHook preInstall

    mkdir --parents ${placeholder "out"}/share/arcan/appl/
    cp -a ./${pname} ${placeholder "out"}/share/arcan/appl/

    runHook postInstall
  '';

  meta = with lib; {
    description = "A dataflow programming and desktop environment";
    homepage = "https://github.com/letoram/pipeworld";
    changelog = "https://github.com/letoram/pipeworld/releases/tag/${version}";
    license = licenses.bsd3;
    platforms = platforms.all;
    maintainers = with maintainers; [ a12l ];
  };
}
