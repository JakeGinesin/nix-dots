let
  key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEw4Uqg9UBakoOpS4nVGE3ePKHnst0+02lFN04n2IyKb ginesin.j@northeastern.edu";
in {
  "zsh_remote.age".publicKeys = [key];
}
