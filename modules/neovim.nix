{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # (import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {}).neovim
    neovim
    (import ./emacs-package.nix { inherit pkgs; })
  ];

  # set appropriate environ variables
  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    GIT_EDITOR = "nvim";
  };
}
