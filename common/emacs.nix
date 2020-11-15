{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # spell chicking stuff
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    hunspellDicts.ru_RU
    # quite essential
    vim
    # nice to keep around
    neovim
    # lsp servers
    lua53Packages.digestif # LaTeX
    clang-tools # C-family
    clang_10
    # org requirements
    gnuplot
    sqlite
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  ];

  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = with pkgs; ((emacsPackagesNgGen emacs).emacsWithPackages (epkgs: [ epkgs.vterm epkgs.pdf-tools ]));
  };
}
