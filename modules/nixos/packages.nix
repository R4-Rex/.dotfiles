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
  
  # Browser
  librewolf
  firefox
  tor-browser
  
  # Discord
  vesktop

  ];
}
