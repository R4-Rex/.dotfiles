{ pkgs, neonix, ... }:
{
  home.packages = [
    neonix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
