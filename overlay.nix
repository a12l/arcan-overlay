final: prev: rec {
  arcan-unwrapped = prev.callPackage ./pkgs/arcan {};
  arcan = prev.callPackage ./wrapper.nix {
    name = "arcan";
  };

  xarcan = prev.callPackage ./pkgs/xarcan {};

  durden-unwrapped = prev.callPackage ./pkgs/durden {};
  # durden = prev.callPackage ./pkgs/durden/wrapper.nix {};
  durden = prev.callPackage ./wrapper.nix {
    name = "durden";
    shmifClient = [ durden-unwrapped ];
  };

  # pipeworld-unwrapped = prev.callPackage ./pkgs/pipeworld {};
  # pipeworld = prev.callPackage ./wrapper.nix {
  #   name = "pipeworld";
  #   shmifClient = [ pipeworld-unwrapped ];
  # };
}
