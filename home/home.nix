{ config, pkgs, ... }:

{
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;

  # Add dotfiles here

  home.file.".config/hypr".source = ../hypr;

  home.packages = with pkgs; [
    neovim
    firefox
    brave
    btop
    zsh
    kitty
  ];

  # Kitty

  programs.kitty = {

  enable = true;

};
  # Set ZSH as default Shell

  # home.sessionVariables.SHELL = "$(pkgs.zsh)/bin/zsh"

  programs.zsh = {
  enable = true;

  oh-my-zsh = {
  enable = true;
  theme = "agnoster";
  plugins = ["kitty" "git" "git-commit" "z" "command-not-found"];
    };

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };
}
