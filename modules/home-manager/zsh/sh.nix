{ config, pkgs, ... }:

let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
  };
in
{
  # ZSH !!!
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    autocd = true;

    shellAliases = myAliases;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "z" "sudo" "colored-man-pages" "colorize" "history" "command-not-found" ];
    };
  };
}
