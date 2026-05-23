{
  config,
  pkgs,
  userSettings,
  ...
}:
{
  home.packages = with pkgs; [ kitty ];

  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/modules/home-manager/kitty/.config/";
    recursive = true;
  };
}
