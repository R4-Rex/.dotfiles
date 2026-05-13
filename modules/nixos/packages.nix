{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    wget

    kitty

    # Image Viewer
    swayimg

    dunst
    libnotify

    git

    # Backup Browser
    firefox

  ];
}
