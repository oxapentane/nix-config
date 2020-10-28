{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
  ];

  # kde related software
  environment.systemPackages = with pkgs; [
    ark
    dolphin
    dragon
    filelight
    firefox
    gajim
    gwenview
    kaddressbook
    kcalc
    kde-gtk-config
    kdeApplications.dolphin-plugins
    kdeApplications.kmail
    kdeApplications.kmail-account-wizard
    kdeApplications.kmailtransport
    kdeApplications.kompare
    kdeApplications.korganizer
    kdeApplications.okular
    kleopatra
    kwalletcli
    okteta
    sddm-kcm
    spectacle
    yakuake
    qbittorrent
    elisa
  ];

  # enable firefox integration
  nixpkgs.config.firefox.enablePlasmaBrowserIntegration = true;
  xdg.portal.gtkUsePortal = true;

  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
  };
  services.xserver.desktopManager.plasma5.enable = true;

  # enable kwallet
  security.pam.services.sddm.enableKwallet = true;

  # use qt-flavoured pinentry
  programs.gnupg.agent.pinentryFlavor = "qt";
}
