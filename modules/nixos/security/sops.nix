{ config, pkgs, userSettings, ... }:

{

  environment.systemPackages = with pkgs; [ sops ];
 
  # SOPS configuration

  sops = {

  defaultSopsFile = ../../../secrets/secrets.yaml; # Path relative to this file
  
  age = {
  
  sshKeyPaths = []; # We're using a user age key, not a host SSH key
  keyFile = "/home/${userSettings.username}/.config/sops/age/keys.txt";

  };

  # Define which secrets to activate
  secrets = {
  email = {
  	
	neededForUsers = true;
        owner = userSettings.username;
	
	}; 
  name = {
  	
	neededForUsers = true;
        owner = userSettings.username;
	
	};
    };
  };
}
