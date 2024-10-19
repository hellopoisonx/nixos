{ ... }:
{
  containers.metacubexd = {
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

        environment.systemPackages = with pkgs; [
          wget
          curl
          git
          nodejs
          neovim
          pnpm
        ];

        users.users.metacubexd = {
          isNormalUser = true;
          extraGroups = [
            "wheel"
          ];
          password = "2016";
        };

        time.timeZone = "Asia/Shanghai";
        system.stateVersion = "24.05";
      };
  };
}
