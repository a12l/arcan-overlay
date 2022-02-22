{
  arcan-unwrapped,
  lib,
  makeWrapper,
  name,
  symlinkJoin,
  shmifClient ? [],
  withXarcan ? true,
  xarcan,
  durden-unwrapped
}:
symlinkJoin {
  inherit name;

  # paths = shmifClient ++ [ arcan-unwrapped ] ++ lib.optionals withXarcan [ xarcan ];
  paths = [ durden-unwrapped ] ++ [ arcan-unwrapped ] ++ lib.optionals withXarcan [ xarcan ];

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    for program in ${placeholder "out"}/bin/*; do
      wrapProgram $program \
        --prefix PATH ":" "${placeholder "out"}/bin/" \
        --set ARCAN_APPLBASEPATH "${placeholder "out"}/share/arcan/appl/" \
        --set ARCAN_BINPATH "${placeholder "out"}/bin/arcan_frameserver" \
        --set ARCAN_LIBPATH "${placeholder "out"}/lib/" \
        --set ARCAN_RESOURCEPATH "${placeholder "out"}/share/arcan/resources/" \
        --set ARCAN_SCRIPTPATH "${placeholder "out"}/share/arcan/scripts/"
    done
  '';
}
