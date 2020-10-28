{ pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      bat
      exa
      exa
      fd
      procs
      ripgrep
      tealdeer
      tokei
    ];

    shellAliases = {
      cat = "bat";
      ls = "exa";
      ll = "exa -l";
      l = "exa -al";
    };
  };
}
