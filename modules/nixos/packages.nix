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

    # might want to use this option
    # networking.firewall.checkReversePath
    proton-vpn # gui
    proton-vpn-cli

  ];
}
