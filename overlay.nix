final: prev:
rec {
  arcan-unwrapped = prev.callPackage ./pkgs/arcan {};
  arcan = prev.callPackage ./wrapper.nix {
    name = "arcan";
  };

  xarcan = prev.callPackage ./pkgs/xarcan {};

  durden-unwrapped = prev.callPackage ./pkgs/durden {};
  durden = prev.callPackage ./wrapper.nix {
    name = "durden";
    clients = [ durden-unwrapped ];
  };

  # pipeworld = prev.callPackage ./wrapper.nix {
  #   name = "pipeworld";
  #   shmifClient = [ pipeworld-unwrapped ];
  # };
}
