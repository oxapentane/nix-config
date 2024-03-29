{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    virt-manager
    bridge-utils
    vagrant
  ];

  environment.variables = {
    VAGRANT_DEFAULT_PROVIDER="libvirt";
  };

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  # virtualization
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.runAsRoot = false;
      qemu.package = pkgs.qemu_full;
    };
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
