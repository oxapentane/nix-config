{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    vteIntegration = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      theme = "sunrise";
      plugins = [
        "colored-man-pages"
        "colorize"
      ];
    };
  };
}
