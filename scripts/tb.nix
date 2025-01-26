{pkgs, ...}: {
  tb = pkgs.writeShellApplication {
    name = "termbin";
    runtimeInputs = with pkgs; [netcat];
    text = ''
      file=$1
      cat "$file" | nc termbin.com 9999
    '';
  };
}
