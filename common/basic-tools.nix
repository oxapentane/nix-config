{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    file
    bind
    gitAndTools.gitFull
    mercurialFull
    gnupg
    graphviz
    htop
    nmap
    tree
    vim
    irssi
    usbutils
    tmux
    ffmpeg-full
    traceroute
    xclip
    wget
    killall
  ];
}
