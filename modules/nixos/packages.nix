{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  
  wget
  
  kitty

  waybar
  
  dunst
  libnotify
  
  rofi-wayland
  
  git
  
  # Browser
  librewolf
  firefox
  tor-browser
  
  # Discord
  vesktop

  ];
}
