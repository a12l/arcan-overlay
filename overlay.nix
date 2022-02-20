final: prev:

rec {
  arcan-unwrapped = prev.callPackage ./pkgs/servers/arcan {};
  arcan = prev.callPackage ./wrapper.nix {
    name = "arcan";
  };
  
  xarcan = prev.callPackage ./pkgs/servers/x11/xarcan {};

  durden = prev.callPackage ./pkgs/desktops/durden {};
  durden-wrapped = prev.callPackage ./wrapper.nix {
    name = "durden-wrapped";
    shmifClient = [ durden ];
  };

  pipeworld =prev.callPackage ./pkgs/applications/window-managers/pipeworld {};
}
