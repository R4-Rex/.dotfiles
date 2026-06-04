{
  config,
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [

    wget

    kitty

    yt-dlp

    # Image Viewer
    swayimg

    dunst
    libnotify

    git

    # Backup Browser
    firefox

  ];
}
