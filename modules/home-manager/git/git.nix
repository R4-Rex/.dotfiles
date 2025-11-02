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
    userName = "R4-Rex";
    userEmail = "itsrex.dev@gmail.com";

    extraConfig = {
      
      pull.rebase = false;
      push.autoSetupRemote = true;
      merge.conflictstyle = "zdiff3";
    
      };
    
    };

}
