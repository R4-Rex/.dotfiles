{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
  neovim
  wget
  kitty
  waybar
  dunst
  libnotify
  rofi-wayland
  git
  librewolf
  firefox
  ];
}
