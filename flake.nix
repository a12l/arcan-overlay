{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = { nixpkgs }: {
    overlay = final: prev: {
      arcan = ./pkgs/arcan;
    };
  };
}
