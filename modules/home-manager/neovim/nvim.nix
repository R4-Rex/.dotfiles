{ config, pkgs, ... }:

{

  programs.neovim = {

    enable = true;
    
    defaultEditor = true;  # Sets EDITOR=nvim
    
    viAlias = true;       # Makes 'vi' open nvim
    vimAlias = true;      # Makes 'vim' open nvim
    
    # Plugins!

    plugins = with pkgs.vimPlugins; [
      
	# Will use lazy vim or something??

      ];
  };

  xdg.configFile."nvim".source = ./nvim;

}
