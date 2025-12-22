{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  
  wget
  
  kitty

  waybar

  # Image Viewer
  swayimg
  
  dunst
  libnotify
  
  git

  # Backup Browser
  firefox

  ];
}
