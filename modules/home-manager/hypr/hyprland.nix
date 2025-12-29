{config, lib, ...}:

# This creates a symbolic symlink at ~/.config/hypr pointing to a copy of
# ~/.dotfiles/hypr in the Nix store.
# Edits in .dotfiles/hypr take effect immediately in the config.
{
  xdg.configFile."hypr/" = {
  source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/hypr/";
  };
}
