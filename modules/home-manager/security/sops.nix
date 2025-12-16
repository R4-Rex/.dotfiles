{ config, pkgs, ... }:

{

  # Systemd config to make other services needing secrets run after this one
  systemd.user.services.mbsync = {
    Unit.After = [ "sops-nix.service" ];
};
  sops = {

    defaultSopsFile = ../../../secrets/secrets.yaml; # Path relative to this file.

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    
    # Home Manager uses user runtime directory, not system /run/secrets
    # The secrets will be available at: $XDG_RUNTIME_DIR/secrets.d/
    secrets = {
    # Add Secrets here
    email = {};
    username = {};
    };
  };
}
