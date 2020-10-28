{ config, ... }:

{
  programs.fish = {
    enable = true;
    # override open to fish built-in one
    shellAliases = {
      o="open";
    };
    # full monte vendor stuff
    vendor = {
      config.enable = true;
      functions.enable = true;
      completions.enable = true;
    };
  };
}
