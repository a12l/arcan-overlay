final: prev:
rec {
  arcan-unwrapped = prev.callPackage ./pkgs/arcan {};
  arcan = prev.callPackage ./wrapper.nix {
    name = "arcan";
  };

  arcan-universe = prev.callPackage ./wrapper.nix {
    name = "arcan-universe";
    clients = [ durden-unwrapped pipeworld-unwrapped ];
  };

  xarcan = prev.callPackage ./pkgs/xarcan {};

  durden-unwrapped = prev.callPackage ./pkgs/durden {};
  durden = prev.callPackage ./wrapper.nix {
    name = "durden";
    clients = [ durden-unwrapped ];
  };

  pipeworld-unwrapped = prev.callPackage ./pkgs/pipeworld {};
  pipeworld = prev.callPackage ./wrapper.nix {
    name = "pipeworld";
    clients = [ pipeworld-unwrapped ];
  };

}
