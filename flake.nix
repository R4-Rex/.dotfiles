
{
  description = "My Fleks";

  inputs = {
    
    # Nix Packages!
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    
    # Home-Manager!
    home-manager = {
    url = "github:nix-community/home-manager/release-25.11";
    inputs.nixpkgs.follows = "nixpkgs"; # makes sure both nixpkgs reference is the same
    };
    
    # My Vars!
    myvars = {

      url = "path:///home/rex/.vars";

    };
    
  };

  outputs = { self, nixpkgs, home-manager, myvars, ... } @inputs:

  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "potato";
      locale = "en_US.UTF-8";
    };
    
    userSettings = {
      username = "rex"; 
      term = "kitty";
      editor = "neovim";
    };
    
    vars = myvars.secrets;

    lib = nixpkgs.lib;
    system = systemSettings.system;
    pkgs = nixpkgs.legacyPackages.system;
    
    # Defines the System
    potato = lib.nixosSystem {
     
     inherit system;

     specialArgs = { inherit systemSettings userSettings vars; };

     modules = [ 
	
       ./nixos/configuration.nix
	
     ];
    };


in {

    #  NIXOS SYSTEM CONFIGURATION
    # Command: sudo nixos-rebuild switch --flake . Or .#potato
    
    nixosConfigurations = {

    "${systemSettings.hostname}" = potato; # normally entire thing was here, but I made it cleaner :))
    
    # Make potato the default for everything :))
    default = potato;
    
    # Normally the rebuild commmand looks for 'nixos' instead of the 'default' I defined above
    # So.. I point the system in the right direction :))

	  nixos = potato; # this is also potato, just in case :))

};
    # STANDALONE HOME MANAGER CONFIGURATION (FLAKE-BASED) 
	  # Command: home-manager switch --flake #user

     homeConfigurations."${userSettings.username}" = home-manager.lib.homeManagerConfiguration 
    {
      pkgs = nixpkgs.legacyPackages.${systemSettings.system};

      extraSpecialArgs = 
      { 
        inherit systemSettings userSettings; 
        inherit inputs; # Pass inputs if needed in home.nix
        inherit vars;
      };

      modules = [
        
        # Home-manager module
        ./home.nix          
        #...
      ];
    };
  };

}

