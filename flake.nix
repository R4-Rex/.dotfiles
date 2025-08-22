
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
        name = "Rex";
        email = "itsrex@gmail.com";
	term = "kitty";
	editor = "neovim";
      };
    

    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${systemSettings.system};

  in {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ ./nixos/configuration.nix ];
	specialArgs = { inherit systemSettings userSettings; };
      };
    };
    homeConfigurations = {
      rex = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
	modules = [./home.nix];
	extraspecialArgs = { inherit systemSettings userSettings; };
      };
    };
  };
}

