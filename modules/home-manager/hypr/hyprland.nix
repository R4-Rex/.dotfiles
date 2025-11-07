{config, lib, ...}:

{
 home.activation.setupHyprSymlink = config.lib.dag.entryAfter ["writeBoundary"] ''
    echo "Setting up Hyprland config symlink..."

    if [ -d "$HOME/.dotfiles/hypr" ] && [ ! -L "$HOME/.config/hypr" ]; 
    then
      ln -sfn "$HOME/.dotfiles/hypr" "$HOME/.config/hypr"

      echo " Hyprland config symlink created"

    elif [ -L "$HOME/.config/hypr" ]; then

      echo " Hyprland symlink already exists"
    else
      echo " Hyprland dotfiles not found at $HOME/.dotfiles/hypr"
    fi
  '';
}
