{
  config,
  pkgs,
  userSettings,
  ...
}:
{
  programs.fastfetch = {

    enable = true;

  };

  xdg.configFile."fastfetch".source =
    config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/modules/home-manager/utils/fastfetch/config/";
}
