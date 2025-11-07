{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bibata-cursors
  ];
  
  # Set cursor theme for user sessions
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  wayland.windowManager.hyprland.settings = {
    cursor = {
      name = "Bibata-Modern-Classic";
      size = 26;
    };
  };
}
