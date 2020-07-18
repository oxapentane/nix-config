{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # spell chicking stuff
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    hunspellDicts.ru_RU
    # still nice to have around
    neovim
  ];
  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = (import ./emacs-package.nix { inherit pkgs; });
  };
}
