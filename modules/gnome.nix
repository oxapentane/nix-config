# everything gnome-related

{ config, pkgs, ... }:

{
  imports = [
    # desktop is a given :D
    ./desktop.nix
  ];

  # display manager
  services.xserver.displayManager.gdm = {
    enable = true;
    wayland = true;
  };

  services.xserver.desktopManager.gnome3.enable = true;

  environment.systemPackages = with pkgs; [
    # gnome-related software
    gajim
    dino
    celluloid
    gnome3.gnome-boxes
    gnome3.gnome-tweaks
    gnome3.evolution
    pinentry_gnome
    gnome3.libsecret
    gnome3.nautilus-python
    #fix theming
    adwaita-qt
    gtk2
    gnome3.gnome-themes-extra
  ];

  # remove raw/unneded bits
  environment.gnome3.excludePackages = with pkgs.gnome3; [
    epiphany
    geary
    gnome-software
    gnome-packagekit
    totem
    gnome-music
  ];

  # explicitly enable some stuff
  services.gnome3 = {
    evolution-data-server.enable = true;
    gnome-keyring.enable = true;
    gnome-online-accounts.enable = true;
    games.enable = true;
  };

  # fix qt theming
  programs.qt5ct.enable = true;

  # disable screen rotation...
  services.xserver.desktopManager.gnome3.extraGSettingsOverrides = ''
    [org.gnome.settings-daemon.peripherals.touchscreen]
    orientation-lock=true
  '';
}
