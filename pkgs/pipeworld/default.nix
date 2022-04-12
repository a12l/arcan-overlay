{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation rec {
  pname = "pipeworld";
  version = "0.0.0+unstable=2022-04-03";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = pname;
    rev = "f60d0b93fcd5462f47b1c928c109f5b4cbd74eef";
    sha256 = "sha256-PNziP5LaUODZwtAHvg8uYt/EyoD3mB5aWIfp7n5a82E=";
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
    maintainers = with maintainers; [a12l];
  };
}
