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
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/modules/home-manager/wezterm/.config/";
    recursive = true;
  };

}
