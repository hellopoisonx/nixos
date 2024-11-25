{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nur.url = "github:nix-community/NUR";
    nixvim = {
      url = "github:hellopoisonx/nixvim";
    };
    my_nur = {
      url = "github:hellopoisonx/nur";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
    {
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem rec {
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
                inherit system;
              };
            }
          ];
        };
      };
    };
}
