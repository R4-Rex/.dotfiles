{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    waybar
  ];
  xdg.configFile."waybar/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/home-manager/waybar/.config/";
    recursive = true;
  };
}
