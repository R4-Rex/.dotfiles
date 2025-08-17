{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Add dotfiles here

  home.file.".config/hypr".source = ../hypr;

  home.packages = with pkgs; [
    vim
    wget
    mako
    rofi
    waybar
    neovim
    firefox
    brave
    vesktop
    btop
    zsh
    oh-my-zsh
    kitty
    git
    preload
    hyprpaper
    bibata-cursors
  ];

  # Kitty

  programs.kitty = {

  enable = true;

};
 
 # hyprland

 home.sessionVariables = {
  XCURSOR_THEME = "Bibata-Modern-Ice";
  XCURSOR_SIZE = "26";
 };

 #! Set ZSH as default Shell

  # home.sessionVariables.SHELL = "$(pkgs.zsh)/bin/zsh"
   
  programs.zsh.enable = true;
  programs.zsh = {

  oh-my-zsh = {
  enable = true;
  theme = "agnoster";
  plugins = ["kitty" "git" "git-commit" "z" "command-not-found"];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

}
