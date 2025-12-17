{config, pkgs, userSettings, myvars, ...}:
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

    user.name = myvars.gitName;
    user.email = myvars.gitEmail;

    pull.rebase = false;
    push.autoSetupRemote = true;
    merge.conflictstyle = "zdiff3";

      };
    
    };

}
