{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    # override open to fish built-in one
    shellAliases = {
      o="open";
      vf="$VISUAL (fzf)";
      vff="$VISUAL (ls|fzf)";
    };
    # full monte vendor stuff
    vendor = {
      config.enable = true;
      functions.enable = true;
      completions.enable = true;
    };
  };

  # starship as a prompt
  environment.systemPackages = [ pkgs.starship ];
  programs.fish.promptInit = "starship init fish | source";
}
