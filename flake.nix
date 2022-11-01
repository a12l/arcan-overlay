{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosModule.arcan = import ./modules;
    
    overlay = import ./overlay.nix;
  };
}
