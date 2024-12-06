{ ... }:
{
  networking.firewall.enable = false;
  networking.hostName = "nixos";
  networking.networkmanager.enable = false;
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}
