{
  config,
  userSettings,
  ...
}:
{
  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.rex.dotpath}/modules/home-manager/kitty/.config/";
    recursive = true;
  };
}
