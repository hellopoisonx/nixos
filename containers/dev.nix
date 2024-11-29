{ inputs, system, ... }:
{
  containers.dev = {
    autoStart = true;
    privateNetwork = true;
    localAddress = "10.231.136.2";
    hostAddress = "10.231.136.1";
    config =
      {
        pkgs,
        lib,
        ...
      }:
      {
        networking = {
          firewall = {
            enable = true;
            allowedTCPPorts = [ 8899 ];
            allowedUDPPorts = [ 8899 ];
          };
          useHostResolvConf = lib.mkForce false;
        };
        services.resolved.enable = true;

        nixpkgs.overlays = [
          (import ./../overlays/nixvim.nix {
            inherit system;
            inherit inputs;
            inherit pkgs;
            inherit lib;
          })
        ];

        environment.systemPackages =
          with pkgs;
          [
            wget
            curl
            git
            unzip
            p7zip
          ]
          ++ [ pkgs.nixvim ];

        users.users.dev = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
          ];
          password = "2016";
        };

        time.timeZone = "Asia/Shanghai";
        system.stateVersion = "24.11";
        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
        ];
      };
  };
}
