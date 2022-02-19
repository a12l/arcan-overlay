{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = { self, nixpkgs }: {
    overlay = final: prev: {
      arcan = ./pkgs/arcan;
      xarcan = ./pkgs/xarcan;
      durden = ./pkgs/durden;
      pipeworld = ./pkgs/pipeworld;
    };
  };
}
