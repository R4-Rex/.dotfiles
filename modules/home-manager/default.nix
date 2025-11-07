{ config, pkgs, ... }:

{
  imports = [
    
    ./zsh/default.nix

    ./cursors.nix

    ./git/git.nix

    ./security/sops.nix

    ./neovim/nvim.nix

    ./onefetch.nix
   
    ./hyprpaper.nix

    ./theme.nix

    ./kitty/default.nix

    ./clipboard.nix

    # Librewolf Config
    ./librewolf/librewolf.nix
  ];
}
