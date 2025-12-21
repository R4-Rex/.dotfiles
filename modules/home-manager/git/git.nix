{config, pkgs, userSettings, vars, ...}:
{

  imports = [

  ./aliases.nix
  ./utils.nix
  ./diff.nix
  ./ui.nix
  ./sign.nix
  
  ];

  programs.git = {

    enable = true;

    settings = {

    user.name = vars.git.name;
    user.email = vars.git.email;

    pull.rebase = false;
    push.autoSetupRemote = true;
    merge.conflictstyle = "zdiff3";

      };
    
    };

}
