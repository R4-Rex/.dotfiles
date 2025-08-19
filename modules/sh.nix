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
  
  autocd = true;

  shellAliases = myAliases;

  oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [ "git" "z" "sudo" "colored-man-pages" "colorize" "history"];
    };
   };
  }
