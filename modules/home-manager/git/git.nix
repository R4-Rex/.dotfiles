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

    user.name = "config.sops.secrets.username";
    user.email = "config.sops.secrets.email";

    pull.rebase = false;
    push.autoSetupRemote = true;
    merge.conflictstyle = "zdiff3";

      };
    
    };

}
