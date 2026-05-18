{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  home.packages = with pkgs; [
    hyprpaper
  ];

  home.file."wallpapers" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/wallpapers/";
    recursive = true;
  };
}
