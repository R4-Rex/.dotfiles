{
  config,
  pkgs,
  userSettings,
  ...
}:
{
  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.rex.dotpath}/modules/home-manager/wezterm/.config/";
    recursive = true;
  };

}
