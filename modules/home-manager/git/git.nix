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
    userName = builtins.readFile config.sops.secrets.name.path;
    userEmail = builtins.readFile config.sops.secrets.email.path;

    extraConfig = {
      
      pull.rebase = false;
      push.autoSetupRemote = true;
      merge.conflictstyle = "zdiff3";
    
      };
    
    };

}
