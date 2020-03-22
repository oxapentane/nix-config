# General Desktop-related config
{ config, pkgs, ... }:

{
  imports = [
  ];
  # on the desktop, we need nice fonts ^^
  fonts.fonts = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    twitter-color-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts
    dina-font
    proggyfonts
    fira
    fira-mono
    twemoji-color-font
    emacs-all-the-icons-fonts
    hack-font
    corefonts
    symbola
  ];

  fonts.enableDefaultFonts = true;
  fonts.fontconfig = {
    enable = true;
    # penultimate.enable = true;
    allowBitmaps = true;
    useEmbeddedBitmaps = true;
  };
}
