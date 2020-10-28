{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # (import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/master.tar.gz") {}).neovim
    vim
    neovim
  ];

  # set appropriate environ variables
  environment.variables = {
    EDITOR = "vi";
    VISUAL = "nvim";
    GIT_EDITOR = "nvim";
  };
}
