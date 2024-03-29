# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  zramSwap = { enable = true; algorithm = "zstd"; };

  networking = {
    hostName = "cirrus"; # Define your hostname.
  };

  systemd.network = {
    enable = true;
    networks."uplink" = {
      matchConfig = { Name = "enp1s0"; };
      networkConfig = {
        Address = "95.216.166.21/32";
        DNS = "9.9.9.9";
      };
      routes = [
        {
          routeConfig = {
            Gateway = "172.31.1.1";
            GatewayOnLink = true;
            Destination = "0.0.0.0/0";
          };
        }
      ];
    };
  };


  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # Open ports in the firewall.
  networking.firewall.enable = true;
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

