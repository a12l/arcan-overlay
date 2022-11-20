{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, ...}@inputs:
    let
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };
    in {
      nixosModule.arcan = import ./modules;
      overlay = import ./overlay.nix;
      
      # packages.x86_64-linux = {
      #   luaarcantui = pkgs.callPakcage ./pkgs/luaarcantui {};
      # };
    };
}
