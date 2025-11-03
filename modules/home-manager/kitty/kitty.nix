{ config, pkgs, ... }:
{
  programs.kitty = {
    
    enable = true;
    
    settings = {

      confirm_os_window_close = 0;
      
      # Window layout
      remember_window_size = true;
      initial_window_width = 1200;
      initial_window_height = 700;
    };
    
    keybindings = {

    };
  };
}
