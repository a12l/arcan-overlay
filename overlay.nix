final: prev:

rec {
  arcan-unwrapped = prev.callPackage ./pkgs/servers/arcan {};
  arcan = prev.callPackage ./wrapper.nix {
    name = "arcan";
  };
  
  xarcan = prev.callPackage ./pkgs/servers/x11/xarcan {};

  durden-unwrapped = prev.callPackage ./pkgs/desktops/durden {};
  durden = prev.callPackage ./wrapper.nix {
    name = "durden";
    shmifClient = [ durden-unwrapped ];
  };

  pipeworld-unwrapped = prev.callPackage ./pkgs/applications/window-managers/pipeworld {};
  pipeworld = prev.callPackage ./wrapper.nix {
    name = "pipeworld";
    shmifClient = [ pipeworld-unwrapped ];
  }
}
