{ config, pkgs, ...}: let
  
  themesDir = "rofi/themes";

in {
  programs.rofi = {
    
    enable = true;

    package = pkgs.rofi-wayland;
    
    terminal = "${pkgs.kitty}/bin/kitty";
    theme = "${config.xdg.dataHome}/${themesDir}/style-1.rasi";
  
  };

  /*****----- Themes -----*****/
  
  xdg.dataFile."${themesDir}/style-1.rasi".source = ./themes/style-1.rasi;

  /*****----- Shared -----*****/

  xdg.dataFile."${themesDir}/shared/colors.rasi".source = ./shared/colors.rasi;
  xdg.dataFile."${themesDir}/shared/fonts.rasi".source = ./shared/fonts.rasi;
  
  /*****----- Color Schemes -----*****/

  xdg.dataFile."${themesDir}/colors/black.rasi".source = ./colors/black.rasi;
  xdg.dataFile."${themesDir}/colors/catppuccin.rasi".source = ./colors/catppuccin.rasi;
  xdg.dataFile."${themesDir}/colors/tokyonight.rasi".source = ./colors/tokyonight.rasi;
  xdg.dataFile."${themesDir}/colors/rosepine.rasi".source = ./colors/rosepine.rasi;

}
