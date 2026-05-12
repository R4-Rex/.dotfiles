{
  pkgs,
  config,
  neonix,
  ...
}:
{
  home.packages = [
    neonix.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  xdg.configFile."stylua/stylua.toml".source = ./stylua.toml;
}
