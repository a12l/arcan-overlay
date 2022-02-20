{ arcan,
  makeWrapper,
  name,
  symlinkJoin,
  shmifClient
    , withXarcan ? true, xarcan
}:

symlinkJoin {
  inherit name;

  paths = [arcan] ++ lib.optionals withXarcan [ xarcan ] ++ shmifClient;

  nativeBuildInputs = [ makeWrapper];

  postBuild = ''
    for program in ${placeholder "out"}/bin/*; do
      wrapProgram $program \
        --prefix PATH ":" "${placeholder "out"}/bin" \
        --set ARCAN_APPLBASEPATH "${placeholder "out"}/share/arcan/appl/" \
        --set ARCAN_BINPATH "${placeholder "out"}/bin/arcan_frameserver" \
        --set ARCAN_LIBPATH "${placeholder "out"}/lib/" \
        --set ARCAN_RESOURCEPATH "${placeholder "out"}/share/arcan/resources/" \
        --set ARCAN_SCRIPTPATH "${placeholder "out"}/share/arcan/scripts/"
    done
  '';

}
