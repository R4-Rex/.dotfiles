{config, pkgs, userSettings, ...}:

{

  imports = [

  ./aliases.nix
  ./utils.nix
  ./diff.nix
  ./ui.nix
  ];

  programs.git = {

    enable = true;

    settings = {

    user.name = "R4-Rex";
    user.email = "itsrex.dev@gmail.com";

    pull.rebase = false;
    push.autoSetupRemote = true;
    merge.conflictstyle = "zdiff3";

      };
    
    };

}
