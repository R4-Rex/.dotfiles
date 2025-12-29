{ config, lib, pkgs, ... }:

{
  config = {
    home.packages = with pkgs; [ onefetch ];
    
    # Optional: Custom config file
    xdg.configFile."onefetch/onefetch.toml".text = ''
      [colors]
      primary = "blue"
      secondary = "cyan"
    '';
  };
}
