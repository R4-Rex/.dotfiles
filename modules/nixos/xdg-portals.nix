 { config, pkgs, ... }: {

  xdg.portal = {
    enable = true;

    # Hyprland Portal for Wayland Integration?
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
      ];
    };

    environment.systemPackages = with pkgs; [
      
      xdg-utils
      xdg-user-dirs
      
      ];
 }
