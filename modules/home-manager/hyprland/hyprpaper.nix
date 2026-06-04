{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2;

      preload = [
        "~/wallpapers/round-thing.png"
      ];

      wallpaper = [
        {
          monitor = "VGA-1";
          path = "~/wallpapers/round-thing.png";
          fit_mode = "cover";
        }
      ];
    };
  };

  home.file."wallpapers" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/wallpapers/";
    recursive = true;
  };
}
