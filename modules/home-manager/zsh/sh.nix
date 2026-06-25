{
  config,
  pkgs,
  lib,
  userSettings,
  ...
}:

{
  home.packages = [ pkgs.zoxide ];

  home.file.".zshrc".source =
    config.lib.file.mkOutOfStoreSymlink "${userSettings.rex.dotpath}/modules/home-manager/zsh/.zshrc";
}
