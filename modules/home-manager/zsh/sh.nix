{ config, pkgs, lib, ... }:

let
  myAliases = {
    ll = "ls -l";
    ".." = "cd ..";
    la = "ls -la";
    "..." = "cd ../..";
  };
in
{
  programs = {
    zsh = {
      enable = true;
      
      zprof.enable = false; # <-- For performance tests
    
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      autocd = true;
      shellAliases = myAliases;

      oh-my-zsh = {
      enable = true;
      plugins = [ 
        "git" 
        "sudo" 
        "colored-man-pages" 
        "command-not-found"
        "z"
        "history"
        ];
      };

      initContent = lib.mkMerge [
      (lib.mkBefore ''
      
      # P10k instant prompt

      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi 
      '')
      ''
      # ZSH options for performance
      setopt NO_BEEP
      setopt NO_LIST_BEEP
      
      # History configuration
      HISTSIZE=1000
      SAVEHIST=1000
      setopt HIST_IGNORE_ALL_DUPS
      setopt HIST_SAVE_NO_DUPS
    ''
    ];
    };
  };
}
