
{
  description = "My Fleks";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # makes sure both nixpkgs reference is the same
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:

  let

    systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = null;
        locale = "en_US.UTF-8";
      };
    userSettings = {
        username = "rex";
        name = "R4-Rex";
        email = "itsrex@gmail.com";
	term = "kitty";
	editor = "neovim";
      };
    

    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};

  in {

    # 🖥️  NIXOS SYSTEM CONFIGURATION
    # Command: sudo nixos-rebuild switch --flake .
    
    nixosConfigurations.nixos = lib.nixosSystem {

	system = systemSettings.system;
	specialArgs = { inherit systemSettings userSettings; };

        modules = [ ./nixos/configuration.nix ];
       };
	
	# 🏠  STANDALONE HOME MANAGER CONFIGURATION (FLAKE-BASED) # home-manager switch

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
	#...
	];
     };
   };
}

