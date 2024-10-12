{ config, ... }:
let
  dir = ".config/clash-meta";
  fullDir = "${config.home.homeDirectory}/${dir}";
in
{
  # home.file."${fullDir}/config.yaml".source = ../../protect/subscriptions/ssp.yaml; 
  # systemd.user.services.clash-meta = {
  #   Unit = {
  #     Description = "Clash.Meta";
  #     After = "network.target";
  #   };
  #   Service = {
  #     Type = "simple"; 
  #     User = "${config.home.username}";
  #     CapabilityBoundingSet = ["CAP_NET_ADMIN" "CAP_NET_BIND_SERVICE" ]; # for TUN mode
  #     Restart = "on-abort";
  #     Group
  #     ExecStart = "clash-meta -d ${fullDir}";
  #   };
  #   Install = {
  #     WantedBy = [ "multi-user.target" ];
  #   };
  # };
}
