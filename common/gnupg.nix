{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    opensc
  ];

  # smartcard support
  services.pcscd.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
