
{
  description = "My Fleks";

  inputs = {
    
    # Nix Packages!
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    
    # Home-Manager!
    home-manager = {

    url = "github:nix-community/home-manager/release-25.05";
    inputs.nixpkgs.follows = "nixpkgs"; # makes sure both nixpkgs reference is the same
    
    };

    # SOPS! ENCRYPTION!
    sops-nix = {

    url = "github:Mic92/sops-nix";
    inputs.nixpkgs.follows = "nixpkgs";

  };

  };

  outputs = { self, nixpkgs, home-manager, sops-nix, ... } @inputs:

  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "nixos";
      locale = "en_US.UTF-8";
    };
    
    userSettings = {
      username = "rex"; 
      term = "kitty";
      editor = "neovim";
    };

    lib = nixpkgs.lib;
    system = systemSettings.system;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};
    in {


    #  NIXOS SYSTEM CONFIGURATION
    # Command: sudo nixos-rebuild switch --flake .
    
    nixosConfigurations.nixos = lib.nixosSystem {

    	inherit system;

	specialArgs = { inherit systemSettings userSettings; };

	modules = [ 
	
	  ./nixos/configuration.nix
	
	  sops-nix.nixosModules.sops
	
	];
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
      };

      modules = [ 
        ./home.nix
	inputs.sops-nix.homeManagerModules.sops
	#...
	];
     };
 
   };

}

