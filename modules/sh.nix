{config, pkgs, ...}:

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
  autosuggestions = true;
  syntaxHighlighting = true;

  autocd = true;

  shellAliases = myAliases;

  oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "z" "sudo" "colored-man-pages" "colorize" "history" "command-not-found"];
    };
   };
  }
