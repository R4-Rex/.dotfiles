{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xrandr
    libxcvt
    wlr-randr
  ];
}
