{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.11";

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosModule.arcan = import ./modules/;#arcan.nix;
    # nixosModule = self.nixosModules.arcan;

    overlay = import ./overlay.nix;
  };
}
