{ config, pkgs, ... }:

{
  imports = [
    
    ./sh.nix

    ./git/git.nix
   
    ./hyprpaper.nix

    ./theme.nix

    ./clipboard.nix

    # Librewolf Config
    ./librewolf/librewolf.nix
  ];
}
