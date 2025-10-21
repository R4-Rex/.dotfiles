{ config, pkgs, ... }:

{
  imports = [
    
    ./sh.nix

    ./git.nix
   
    ./hyprpaper.nix

    # Librewolf Config
    ./librewolf/librewolf.nix
  ];
}
