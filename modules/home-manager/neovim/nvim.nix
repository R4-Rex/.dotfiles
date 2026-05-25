{
  pkgs,
  config,
  neonix,
  ...
}:
{
  home.packages = [
    neonix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.ripgrep
    pkgs.fd
  ];
  xdg.configFile."stylua/stylua.toml".source = config.lib.file.mkOutOfStoreSymlink ./stylua.toml;
}
