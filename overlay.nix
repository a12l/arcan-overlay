final: prev: rec {
  arcan-unwrapped = prev.callPackage ./pkgs/arcan {};
  arcan = prev.callPackage ./wrapper.nix {
    name = "arcan";
    clients = [ arcan-unwrapped ];
  };

  arcan-universe = prev.callPackage ./wrapper.nix {
    name = "arcan-universe";
    clients = [
      cat9-unwrapped
      durden-unwrapped
      pipeworld-unwrapped
      arcan-unwrapped
      luaarcantui-unwrapped
      (prev.lua5_1.withPackages (ps: [
        ps.lua-lsp
      ]))
    ];
  };

  cat9-unwrapped = prev.callPackage ./pkgs/cat9 {};
  cat9 = prev.callPackage ./pkgs/cat9/wrapper.nix {
    name = "cat9";
    clients = [ arcan-unwrapped cat9-unwrapped ];
  };

  durden-unwrapped = prev.callPackage ./pkgs/durden {};
  durden = prev.callPackage ./wrapper.nix {
    name = "durden";
    clients = [ arcan-unwrapped durden-unwrapped ];
  };

  pipeworld-unwrapped = prev.callPackage ./pkgs/pipeworld {};
  pipeworld = prev.callPackage ./wrapper.nix {
    name = "pipeworld";
    clients = [ arcan-unwrapped pipeworld-unwrapped ];
  };

  luaarcantui-unwrapped = prev.callPackage ./pkgs/luaarcantui {};
  luaarcantui = prev.callPackage ./wrapper.nix {
    name = "luaarcantui";
    clients = [ arcan-unwrapped luaarcantui-unwrapped ];
  };

  Xarcan = prev.callPackage ./pkgs/Xarcan {};
}
