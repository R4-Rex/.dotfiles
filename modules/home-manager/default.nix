{ config, pkgs, ... }:

{
  imports = [
    
    ./zsh/default.nix

    ./git/git.nix

    ./security/sops.nix

    ./neovim/nvim.nix

    ./onefetch.nix
   
    ./hyprpaper.nix

    ./theme.nix

    ./clipboard.nix

    # Librewolf Config
    ./librewolf/librewolf.nix
  ];
}
