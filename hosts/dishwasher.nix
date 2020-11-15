{ config, pkgs, ... }:
let
  stable = import <nixos-stable> {config = { allowUnfree = true; }; };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../common/neovim.nix
    ../common/desktop.nix
    ../common/gnome.nix
    ../common/fish.nix
    ../common/hw-accel-intel.nix
    ../common/wireguard-mullvad.nix
    ../common/kernel-latest.nix
    ../common/tlp.nix
    ../common/science.nix
    ../common/lorri.nix
    ../common/rust-playground.nix
  ];

  nix.maxJobs = 8;

  networking.hostName = "dishwasher"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console.font = "Lat2-Terminus16";
  console.keyMap = "us";

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # overlays
  nixpkgs.overlays = [
    (self: super:
    {
      nextcloud-client = super.nextcloud-client.overrideAttrs (old: {
        version = "3.0.2";

        src = super.fetchFromGitHub {
          owner = "nextcloud";
          repo = "desktop";
          rev = "v3.0.2";
          sha256 = "0qzriiaj6sjdkgh61iihvpsvhi0kvfwjz1vvjnwdlfdx2s4xmv24";
        };
      });
    })
  ];

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    audacity
    blender
    deadbeef-with-plugins
    flameshot
    gimp
    gnuradio
    gqrx
    inkscape
    kdenlive
    keepassxc
    kicad
    nextcloud-client
    pavucontrol
    pciutils
    screen-message
    seafile-client
    signal-desktop
    tdesktop
    urh
    virtmanager
    wireguard
    youtube-dl
    hackrf
    anki
  ];

  services.fstrim.enable = true;

  boot = {
    # kernelParams = [ "intel_idle.max_cstate=1" "i915.enable_dc=0" ]; # should fix broken intel graphics driver
    supportedFilesystems = ["btrfs"];

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
  hardware.enableAllFirmware = true;

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
    tapping = true;
    accelProfile = "adaptive";
    # clickMethod = "clickfinger";
  };

  # global environment
  environment = {
    variables = {
      PAGER = "less -F";
    };
    shellAliases = {
      o="xdg-open";
      e="$EDITOR";
      v="$VISUAL";
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
    shell = pkgs.fish;
    isNormalUser = true;
    uid = 1000;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "21.03"; # Did you read the comment?

}
