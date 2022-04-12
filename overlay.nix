final: prev: rec {
  arcan = prev.callPackage ./pkgs/arcan {};

  arcan-universe = prev.callPackage ./wrapper.nix {
    name = "arcan-universe";
    clients = [durden pipeworld arcan];
  };

  Xarcan = prev.callPackage ./pkgs/Xarcan {};

  durden = prev.callPackage ./pkgs/durden {};

  pipeworld = prev.callPackage ./pkgs/pipeworld {};

  tui-bindings-lua = prev.callPackage ./pkgs/tui-bindings-lua {};
}
