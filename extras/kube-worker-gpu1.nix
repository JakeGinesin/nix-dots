{
  services.kubernetes = {
    roles = ["node"];  # Only "node", not "master"
    
    masterAddress = "192.168.1.100";  # Your master's IP
    
    # Enable required components for a worker
    kubelet.enable = true;
    proxy.enable = true;
    flannel.enable = true;  # Or whatever CNI you're using
    
    # Use the same certificate setup
    easyCerts = true;
    pki.enable = true;
    
    # Kubelet configuration
    kubelet = {
      kubeconfig.server = "https://192.168.1.100:6443";
      hostname = "worker-gpu1";  # Or use the actual hostname
      extraOpts = "--fail-swap-on=false";  # If you have swap enabled
    };
  };
  
  # Container runtime
  virtualisation.containerd.enable = true;
  
  # Open required ports
  networking.firewall.allowedTCPPorts = [ 
    10250  # Kubelet API
    30000-32767  # NodePort Services (optional)
  ];
  
  # Ensure hostname is set properly
  networking.hostName = "worker-gpu1";  # Or your preferred name
}
