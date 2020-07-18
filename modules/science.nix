{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    R
    texlive.combined.scheme-full
    gnuplot
    graphicsmagick
    zotero
  ];
}
