{ config, pkgs, ... }:
{
  programs.fastfetch = {
    
    enable = true;

    };

  xdg.configFile."fastfetch".source = 
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/home-manager/utils/fastfetch/config/";
}
