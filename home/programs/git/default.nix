{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;

    userName = "JakeGinesin";
    userEmail = "jakeginesin@gmail.com";

    # extraConfig = {
    # commit.gpgsign = true;
    # gpg.format = "ssh";
    # gpg.ssh.allowedSignersFile = "/home/synchronous/.ssh/allowed_signers";
    # user.signingkey = "/home/synchronous/.ssh/github_synchronous_signing.pub";
    # rebase.updateRefs = true;
    # };
  };
}
