{
  stdenv,
  lib,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "durden";
  version = "0.0.0+unstable=2022-10-29";

  src = fetchFromGitHub {
    owner = "letoram";
    repo = finalAttrs.pname;
    rev = "bba14be3c7c33db58abfce179b7f99d82a0af36b";
    sha256 = "1h5jr6xbcccki16bxj11dir37b7syddvpgcjxxkypkga8gl10h30";
  };

  dontConfigure = true;

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir --parents ${placeholder "out"}/share/arcan/appl/
    cp -a ./${finalAttrs.pname} ${placeholder "out"}/share/arcan/appl/

    runHook postInstall
  '';

  meta = with lib; {
    description = "A desktop environment for the Arcan Display Server";
    homepage = "https://github.com/letoram/durden";
    changelog = "https://github.com/letoram/durden/releases/tag/${version}";
    license = licenses.bsd3;
    platforms = platforms.all;
  };
})
