{
  config,
  pkgs,
  lib,
  ...
}: {
  swapDevices = lib.mkForce [];

  boot = {
    kernel.sysctl = {
      # Enable IP forwarding (required for pod networking)
      "net.ipv4.ip_forward" = 1;
      "net.ipv6.conf.all.forwarding" = 1;

      # Enable bridge netfilter (required for iptables rules on bridge traffic)
      "net.bridge.bridge-nf-call-iptables" = 1;
      "net.bridge.bridge-nf-call-ip6tables" = 1;
    };
  };
  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [
    # 6443 # k3s: required so that pods can reach the API server (running on port 6443 by default)
    # # 2379 # k3s, etcd clients: required if using a "High Availability Embedded etcd" configuration
    # # 2380 # k3s, etcd peers: required if using a "High Availability Embedded etcd" configuration
  # ];
  # networking.firewall.allowedUDPPorts = [
    # # 8472 # k3s, flannel: required if using multi-node for inter-node networking
  # ];
  services.k3s = {
    enable = true;
    role = "agent";
    # token = "jakeginesin12345678910";
    tokenFile = config.age.secrets.kube.path;
    serverAddr = "https://172.24.233.22:6443";
  };
}
