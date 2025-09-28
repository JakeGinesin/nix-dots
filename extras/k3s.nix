{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.etc."rancher/k3s/registries.yaml".text = ''
    mirrors:
      "100.125.181.75:5000":
        endpoint:
          - http://100.125.181.75:5000/v2
    configs:
      "100.125.181.75:5000":
        tls:
          insecure_skip_verify: true
  '';

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

  environment.systemPackages = with pkgs; [
    kubernetes-helm
  ];

  boot.kernelModules = ["rbd" "nbd" "ceph"];

  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [
  # 6443 # k3s: required so that pods can reach the API server

  # ];

  # networking.firewall.allowedUDPPorts = [

  # ];

  services.k3s = {
    enable = true;
    role = "server";
    # token = "jakeginesin12345678910";
    tokenFile = config.age.secrets.kube.path;
    clusterInit = true;

    extraFlags = toString [
      # "--bind-address=0.0.0.0" # API server listens on all interfaces
      # "--advertise-address=100.125.181.75" # Advertise this IP to cluster members
      # "--node-ip=100.125.181.75" # Primary IP for this node
      # "--node-external-ip=100.125.181.75" # External IP for services
      # "--tls-san=100.125.181.75" # Add IP to TLS certificate
    ];
  };
}
