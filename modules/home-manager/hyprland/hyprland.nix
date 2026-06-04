{ config, lib, userSettings, ... }:

# This creates a symbolic symlink at ~/.config/hypr pointing to a copy of
# ~/.dotfiles/hypr in the Nix store.
# Edits in .dotfiles/hypr take effect immediately in the config.
{

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    extraConfig = ''
      require("therealconfig.hyprconfig")
    '';
  };
  xdg.configFile."hypr/therealconfig/" = {
    source = config.lib.file.mkOutOfStoreSymlink "${userSettings.dotpath}/modules/home-manager/hyprland/.config/therealconfig/";
  };
}
