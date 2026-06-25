{ pkgs, config, userSettings, ... }:
{
  home.packages = with pkgs; [
    waybar
  ];
  xdg.configFile."waybar/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.rex.dotpath}/modules/home-manager/waybar/.config/";
    recursive = true;
  };
}
