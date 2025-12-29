{ config, pkgs, ...}:
{
  # File Manager

  programs.lf = {
    
    enable = true;

    settings = {
      
      hidden = true;

    };
  };
}
