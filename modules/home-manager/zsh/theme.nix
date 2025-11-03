{ config, pkgs, ... }:
{
  programs.zsh = {
    plugins = [
      { # Da Plugin!
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "p10k-config";
        src = ./p10k;  # Da Custom config folder
        file = ".p10k.zsh";
      }
    ];
  };
}
