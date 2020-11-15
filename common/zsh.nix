{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    vteIntegration = true;
    syntaxHighlighting.enable = true;
  };

  # starship as a prompt
  environment.systemPackages = [ pkgs.starship ];
  programs.zsh.promptInit = "eval $(starship init zsh)";
}
