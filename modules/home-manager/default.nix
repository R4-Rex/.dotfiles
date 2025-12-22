{ config, pkgs, ... }:

{
  imports = [
    
    ./zsh/default.nix

    ./cursors.nix

    ./git/git.nix

    ./neovim/nvim.nix

    ./onefetch.nix

    ./hypr/default.nix
   
    ./theme.nix

    ./rofi/default.nix

    ./kitty/default.nix

    ./clipboard.nix

    # Browsers
    ./browsers/default.nix
    
    # Discord
    ./discord.nix
  ];
}
