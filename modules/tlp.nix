{ config, pkgs, ... }:

{
  powerManagement.cpuFreqGovernor = null;
  services.tlp.enable = true;
}
