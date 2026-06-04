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
        "~/wallpapers/batman-logo.jpg"
      ];

      wallpaper = [
        {
          monitor = "VGA-1";
          path = "~/wallpapers/batman-logo.jpg";
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
