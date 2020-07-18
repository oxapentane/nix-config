{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nix-config/modules/desktop.nix
    ./nix-config/modules/kde.nix
    ./nix-config/modules/neovim.nix
    ./nix-config/modules/zsh.nix
    ./nix-config/modules/hw-accel-intel.nix
    ./nix-config/modules/wireguard-mullvad.nix
    ./nix-config/modules/kernel-latest.nix
    ./nix-config/modules/tlp.nix
    ./nix-config/modules/science.nix
  ];

  fileSystems."/".options = [ "noatime" "nodiratime" "discard" ];

  networking.hostName = "dishwasher"; # Define your hostname.
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
    audacity
    blender
    deadbeef-with-plugins
    firefox
    flameshot
    gimp
    gnuradio
    gqrx
    inkscape
    kdenlive
    keepassxc
    kicad
    libreoffice
    mpv-with-scripts
    nextcloud-client
    pavucontrol
    pciutils
    profanity
    qbittorrent
    screen-message
    seafile-client
    signal-desktop
    tdesktop
    urh
    virtmanager
    wireguard
    youtube-dl
  ];

  boot = {
    # extra encryption config
    initrd = {
      luks.devices = {
        root = {
          name = "root";
          device = "/dev/disk/by-uuid/9108c217-0136-48bc-a6f3-de7b6363cf5e";
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
