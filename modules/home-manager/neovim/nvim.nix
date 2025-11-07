{ config, pkgs, lib, ... }:

{

  programs.neovim = {

    enable = true;
    
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;    

  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/home-manager/neovim/nvim";

}
