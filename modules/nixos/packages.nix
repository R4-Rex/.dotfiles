{
  config,
  inputs,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [

    wget

    jq

    kitty

    yt-dlp

    # Image Viewer
    swayimg

    dunst
    libnotify

    git

  ];
}
