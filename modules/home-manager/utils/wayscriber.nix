{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wayscriber
  ];
}
