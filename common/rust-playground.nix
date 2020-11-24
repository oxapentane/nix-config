{ pkgs, lib, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      exa
      fd
      procs
      ripgrep
      tealdeer
      tokei
    ];

    shellAliases = {
      ls = "exa";
      ll = "exa -l";
      l = "exa -al";
    };
  };
}
