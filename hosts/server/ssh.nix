{
  config,
  pkgs,
  ...
}: {
  services.openssh.enable = true;

  # Disable password login for security
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitRootLogin = "no";

  # Add your authorized key for a specific user
  users.users.yourusername = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      config.age.secrets.ssh-pub
    ];
  };
}
