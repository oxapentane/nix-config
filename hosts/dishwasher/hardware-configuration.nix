# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2971597a-b364-405d-8bb2-287556e819e1";
      fsType = "btrfs";
      options = [ "subvol=nixos" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/lib" =
    { device = "/dev/disk/by-uuid/2971597a-b364-405d-8bb2-287556e819e1";
      fsType = "btrfs";
      options = [ "subvol=var-lib" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/disk/by-uuid/2971597a-b364-405d-8bb2-287556e819e1";
      fsType = "btrfs";
      options = [ "subvol=var-log" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/microvms" =
    { device = "/dev/disk/by-uuid/2971597a-b364-405d-8bb2-287556e819e1";
      fsType = "btrfs";
      options = [ "subvol=microvms" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/2971597a-b364-405d-8bb2-287556e819e1";
      fsType = "btrfs";
      options = [ "subvol=nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/2A04-BFAE";
      fsType = "vfat";
    };

  swapDevices = [ ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  services.logind.lidSwitch = "ignore";
}
