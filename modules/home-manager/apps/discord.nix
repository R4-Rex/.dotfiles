{ config, pkgs, ... }:
{
  programs.vesktop = {
    enable = true;
    settings = {
      discordBranch = "stable";
      arRPC = true;
      hardwareVideoAcceleration = true;
      enableSplashScreen = false;
      hardwareAcceleration = true;
      customTitleBar = false;
      staticTitle = true;
      appBadge = false;
      checkUpdates = false;
      disableMinSize = true;
      splashTheming = true;
    };
  };
}
