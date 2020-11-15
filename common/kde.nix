{ config, pkgs, ... }:

{
  imports = [
    ./desktop.nix
  ];

  # kde related software
  environment.systemPackages = with pkgs; [
    ark
    dolphin
    vlc
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
    kdeApplications.pim-sieve-editor
    kdeApplications.kdepim-apps-libs
    kdeApplications.kdepim-addons
    kdeApplications.pim-data-exporter
    kleopatra
    kwalletcli
    okteta
    sddm-kcm
    spectacle
    yakuake
    qbittorrent
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
