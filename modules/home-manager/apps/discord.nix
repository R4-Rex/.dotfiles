{ config, pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      arRPC = true;
      hardwareAcceleration = false;
      hardwareVideoAcceleration = false;
      enableSplashScreen = false;
      customTitleBar = false;
      staticTitle = true;
      appBadge = false;
      checkUpdates = false;
      disableMinSize = true;
      splashTheming = true;
    };
  };
}
