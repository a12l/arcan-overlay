{
  description = "The Arcan overlay";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, ...}@inputs: {
    nixosModule.arcan = import ./modules;
    overlay = import ./overlay.nix;

    # packages.x86_64-linux.luaarcantui = import ./pkgs/luaarcantui;
  };
}
