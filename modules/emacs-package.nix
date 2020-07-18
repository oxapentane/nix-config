{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs.override {
    withGTK3 = true;
    withGTK2 = false;
  };
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
emacsWithPackages (epkgs: [
  epkgs.vterm
])
