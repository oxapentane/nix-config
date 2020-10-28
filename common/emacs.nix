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
    # lsp servers
    lua53Packages.digestif # LaTeX
    clang-tools # C-family
    clang_10
  ];

  services.emacs = {
    enable = true;
    defaultEditor = true;
    package = (import ./emacs-package.nix { inherit pkgs; });
  };
}
