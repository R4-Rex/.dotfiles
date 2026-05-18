{ pkgs, config, userSettings, ... }:
{
  home.packages = with pkgs; [
    waybar
  ];
  xdg.configFile."waybar/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/modules/home-manager/waybar/.config/";
    recursive = true;
  };
}
