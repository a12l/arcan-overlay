{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }: {
    overlay = final: prev: {
      arcan = prev.callPackage ./pkgs/arcan {};
      xarcan = prev.callPackage ./pkgs/xarcan {};
      durden = prev.callPackage ./pkgs/durden {};
      pipeworld =prev.callPackage ./pkgs/pipeworld {};
    };
  };
}
