{
  arcan-unwrapped,
  # lib,
  makeWrapper,
  name,
  symlinkJoin,
  clients ? [],
  # withXarcan ? true,
  # xarcan,
}:
symlinkJoin {
  inherit name;

  paths = clients ++ [ arcan-unwrapped ]; # ++ lib.optionals withXarcan [ xarcan ];

  nativeBuildInputs = [ makeWrapper ];

  postBuild = ''
    for program in ${placeholder "out"}/bin/*; do
      wrapProgram $program \
        --prefix PATH ":" "${placeholder "out"}/bin/" \
        --set ARCAN_APPLBASEPATH "${placeholder "out"}/share/arcan/clients/" \
        --set ARCAN_BINPATH "${placeholder "out"}/bin/arcan_frameserver" \
        --set ARCAN_LIBPATH "${placeholder "out"}/lib/" \
        --set ARCAN_RESOURCEPATH "${placeholder "out"}/share/arcan/resources/" \
        --set ARCAN_SCRIPTPATH "${placeholder "out"}/share/arcan/scripts/"
    done
  '';
}
