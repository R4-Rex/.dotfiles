{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  
  wget
  
  kitty

  waybar
  
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
