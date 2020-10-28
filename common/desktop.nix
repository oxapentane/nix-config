# General Desktop-related config
{ config, pkgs, ... }:

{
  imports = [
    ./basic-tools.nix
    ./gnupg.nix
  ];

  # on the desktop, we need nice fonts ^^
  fonts.fonts = with pkgs; [
    corefonts
    dina-font
    emacs-all-the-icons-fonts
    fira
    fira-code
    fira-code-symbols
    fira-mono
    hack-font
    iosevka
    liberation_ttf
    mplus-outline-fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    proggyfonts
    symbola
    twemoji-color-font
    twitter-color-emoji
  ];

  fonts.enableDefaultFonts = true;
  fonts.fontconfig = {
    enable = true;
    # penultimate.enable = true;
    allowBitmaps = true;
    useEmbeddedBitmaps = true;
  };

  # Enable sound.
  sound.enable = true;

  # hardware block
  hardware = {
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      extraModules = [ pkgs.pulseaudio-modules-bt ];
    };

    bluetooth.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
}
