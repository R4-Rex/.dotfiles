{ config, pkgs, ... }:

{
  home.username = "rex";
  home.homeDirectory = "/home/rex";

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Add dotfiles here
  home.file.".config/hypr".source = ../hypr;
  home.file.".config/waybar".source = ../waybar;
  home.file.".config/kitty".source = ../kitty;

  home.packages = with pkgs; [
    neovim
    firefox
    brave
    btop
  ];

  programs.zsh.enable = true;
  # Add more options as needed
}
