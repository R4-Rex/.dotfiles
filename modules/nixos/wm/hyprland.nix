{ inputs, pkgs, ... }:
{
  programs.hyprland = {
    enable = true;
    withUWSM  = false;
    # set the flake package
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "0";
    NIXOS_OZONE_WL = "1";
  };
}
