{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ hyprpaper ];

  services.hyprpaper = {

    enable = true;
    
    settings = {
      
      # Gives the ability to control hyprpaper using 'hyprctl'?
      ipc = "on";  

      # Splash Screen?
      splash = false;

      preload = [
        "~/.dotfiles/wallpapers/batman-logo.jpg"
      ];
      wallpaper = [
        "VGA-1,~/.dotfiles/wallpapers/batman-logo.jpg"
      ];
    };
  };
}
