# overrides to enable [sometimes] wonky intel acceleration
{ config, pkgs, ... }:

{
  # full monte intel hw acceleration
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];
  };

  boot.initrd.kernelModules = [ "i915" ];

  boot.kernelParams = [
    "i915.enable_fbc=1"
    "i915.enable_psr=2"
  ];

  services.fstrim.enable = true;
}
