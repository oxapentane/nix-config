{ config, pkgs, ... }:

{
  services.lorri.enable = true;
  environment.systemPackages = [ pkgs.direnv ];

  programs.zsh.shellInit = "eval \"$(direnv hook zsh)\"";
  programs.bash.shellInit = "eval \"$(direnv hook bash)\"";
}
