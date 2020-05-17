{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nix-config/modules/desktop.nix
    ./nix-config/modules/gnome.nix
    ./nix-config/modules/neovim.nix
    ./nix-config/modules/zsh.nix
    ./nix-config/modules/hw-accel-intel.nix
    ./nix-config/modules/wireguard-mullvad.nix
    ./nix-config/modules/kernel-latest.nix
    ./nix-config/modules/tlp.nix
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  networking.hostName = "nixbox"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  console.keyMap = "us";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    R
    aspell
    aspellDicts.de
    aspellDicts.en
    aspellDicts.ru
    audacity
    bind
    blender
    deadbeef-with-plugins
    ffmpeg-full
    file
    firefox
    flameshot
    gimp
    gitAndTools.gitFull
    gnupg
    gnuplot
    gnuradio
    gqrx
    graphviz
    htop
    inkscape
    kdenlive
    keepassxc
    kicad
    killall
    libreoffice
    mpv-with-scripts
    nextcloud-client
    nmap
    opensc
    pavucontrol
    pciutils
    profanity
    qbittorrent
    screen-message
    seafile-client
    signal-desktop
    tdesktop
    texlive.combined.scheme-full
    tmux
    urh
    usbutils
    vim
    virtmanager
    irssi
    wget
    wireguard
    xclip
    youtube-dl
    traceroute
    tree
    zotero
  ];

  boot = {
    # extra encryption config
    initrd = {
      luks.devices = {
        root = {
          name = "root";
          device = "/dev/disk/by-uuid/4fbe7291-61b1-49e4-8cb9-68c102e80b7c";
          preLVM = true;
          allowDiscards = true;
        };
      };
    };

    # use systemd boot by default
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    tmpOnTmpfs = true;
    plymouth.enable = false;
  };

  # update the microcode
  hardware.cpu.intel.updateMicrocode = true;

  # virtualization
  boot.kernelModules = [ "kvm-intel" ];
  virtualisation = {
    libvirtd = {
      enable = true;
      qemuRunAsRoot = false;
    };
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark-qt;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # smartcard support
  services.pcscd.enable = true;

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

  # Enable touchpad support.
  services.xserver.libinput = {
    enable = true;
    disableWhileTyping = true;
    naturalScrolling = true;
    scrollMethod = "twofinger";
    tapping = false;
    accelProfile = "adaptive";
    clickMethod = "clickfinger";
  };

  # global environment
  environment = {
    variables = {
      PAGER = "less";
    };
    shellAliases = {
      o="xdg-open";
      e="$EDITOR";
      cpy="xclip -selection clipboard";
      pst="xclip -selection clipboard -o";
      grep = "grep --color=auto";
    };
  };

  # Shell config (bash)
  programs.bash = {
    enableCompletion = true;
    vteIntegration = true;
  };

  # Users
  users.users.oxa = {
    createHome = true;
    extraGroups = [ "wheel" "audio" "video" "disk" "networkmanager"
    "systemd-journald" "wireshark" "libvirtd" "dialout"];
    group = "users";
    home = "/home/oxa";
    isNormalUser = true;
    uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?

}
