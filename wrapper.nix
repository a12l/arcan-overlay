{
  lib,
  makeWrapper,
  name,
  symlinkJoin,
  clients ? [],
}:
symlinkJoin {
  inherit name;

  paths = clients;

  nativeBuildInputs = [makeWrapper];

  postBuild = ''
    for program in ${placeholder "out"}/bin/*; do
      wrapProgram $program \
        --prefix PATH ":" "${placeholder "out"}/bin/" \
        --set ARCAN_APPLBASEPATH "${placeholder "out"}/share/arcan/appl/" \
        --set ARCAN_APPLSTOREPATH "$HOME/.arcan/" \
        --set ARCAN_APPLTEMPPATH "/tmp/" \
        --set ARCAN_BINPATH "${placeholder "out"}/bin/arcan_frameserver" \
        --set ARCAN_STATEBASEPATH "$HOME/.arcan/state/"
    done
  '';
}
