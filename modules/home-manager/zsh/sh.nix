{ config, pkgs, lib, ... }:

{
  home.packages = [ pkgs.zoxide ];
  
    home.activation.linkZshrc = config.lib.dag.entryAfter ["writeBoundary"] ''
    if [ ! -L "$HOME/.zshrc" ]; then
      ln -sf "$HOME/.dotfiles/modules/home-manager/zsh/.zshrc" "$HOME/.zshrc"
    fi
    '';
}
