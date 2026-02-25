{ pkgs, neonix, ... }:
{
  home.packages = [
    neonix.packages.${pkgs.system}.default
  ];
}
