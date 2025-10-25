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
    userName = userSettings.name;
    userEmail = userSettings.email;

    extraConfig = {
      
      pull.rebase = false;
      push.autoSetupRemote = true;
      merge.conflictstyle = "zdiff3";
    
      };
    
    };

}
