{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    grim
  ];
  services.flameshot = {
    enable = true;
    settings = {
      General = {

        savePath = "${config.home.homeDirectory}/Screenshots";
        filenamePattern="+%Y_%m_%d_%H-+%s";
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        saveAsFileExtension = ".png";
        showDesktopNotification = true;
        showAbortNotification = false;
        showHelp = true;
        # Whether to show the left side button in GUI mode
        showSidePanelButton = true;

        uiColor = "#4A4A4A";
        contrastUiColor = "#DFF7F7";
        drawColor = "#ff0000";

        # For Wayland (Install Grim seperately)
        useGrimAdapter = true;
        disabledGrimWarning = true;
      };
    };
  };
}
