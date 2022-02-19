final: prev:

{
  arcan = prev.callPackage ./pkgs/servers/arcan {};
  xarcan = prev.callPackage ./pkgs/servers/x11/xarcan {};
  durden = prev.callPackage ./pkgs/desktops/durden {};
  pipeworld =prev.callPackage ./pkgs/applications/window-managers/pipeworld {};
}
