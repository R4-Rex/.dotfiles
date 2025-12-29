{ config, pkgs, lib, ... }:

{
  home.packages = [ pkgs.zoxide ];
  
    home.file.".zshrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/home-manager/zsh/.zshrc";
}
