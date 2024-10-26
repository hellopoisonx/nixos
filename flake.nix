{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim-conf = {
      url = "github:hellopoisonx/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    browser-previews = {
      url = "github:nix-community/browser-previews"; inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./system
            ./containers
            ./overlays/overlays.nix
            {
              _module.args = {
                inherit inputs;
              };
            }
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "bk";
              home-manager.users.hpxx = import ./home;
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
            }
          ];
        };
      };
    };
}
