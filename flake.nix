{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, ...}@inputs:
    let
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };

      arcan-unwrapped = system: inputs.nixpkgs.legacyPackages.${system}.callPackage ./pkgs/arcan.nix {};
      arcan = system: inputs.nixpkgs.legacyPackages.${system}.callPackage ./wrapper.nix {
        name = "arcan";
        clients = [ arcan-unwrapped ];
      };
    in {
      nixosModule.arcan = import ./modules;
      # nixosModule = self.nixosModule.arcan;

      overlay = import ./overlay.nix;

      packages."x86_64-linux".arcan-unwrapped = arcan-unwrapped "x86_64-linux";
      defaultPackage."x86_64-linux" = self.packages."x86_64-linux".arcan-unwrapped;

      packages."x86_64-linux".arcan = arcan "x86_64-linux";
    };
}
