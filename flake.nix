{
  description = "My Fleks";

  nixConfig = {
    substituters = [
      # Order Matters here...
      # Official Cache
      "https://cache.nixos.org"
      # Hyprland Cachix
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      # Official Key
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      # Hyprland Key
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {

    # Nix Packages!
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Home-Manager!
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs"; # makes sure both nixpkgs reference is the same
    };
    # Hyprland!
    hyprland = {
      url = "github:hyprwm/Hyprland?ref=v0.55.2";
    };
    hypr-dynamic-cursors = {
      url = "github:VirtCode/hypr-dynamic-cursors";
      inputs.hyprland.follows = "hyprland";
    };
    # NixCord
    nixcord.url = "github:FlameFlag/nixcord";

    # Neonix
    neonix = {
      url = "github:Rex-Prime/neonix-wrapper";
    };

    # My Vars!
    myvars = {
      url = "path:///home/rex/.vars";
    };

  };

  outputs =
    {
      nixpkgs,
      home-manager,
      myvars,
      neonix,
      ...
    }@inputs:

    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "potato";
        locale = "en_US.UTF-8";
      };

      userSettings = {
        username = "rex";
        term = "kitty";
        editor = "nvim";
        dotpath = "/home/${userSettings.username}/dotnix";
      };

      vars = myvars.secrets;

      lib = nixpkgs.lib;
      system = systemSettings.system;
      pkgs = nixpkgs.legacyPackages.${system};

      # Defines the System
      potato = lib.nixosSystem {

        inherit system;

        specialArgs = {
          inherit
            inputs
            systemSettings
            userSettings
            vars
            ;
        };

        modules = [

          ./nixos/configuration.nix

          {
            # given the users in this list the right to specify additional substituters via:
            #    1. `nixConfig.substituters` in `flake.nix`
            nix.settings.trusted-users = [ "rex" ];
          }

        ];
      };

    in
    {

      #  NIXOS SYSTEM CONFIGURATION
      # Command: sudo nixos-rebuild switch --flake . Or .#potato

      nixosConfigurations = {

        "${systemSettings.hostname}" = potato; # normally entire thing was here, but I made it cleaner :))

        # Make potato the default for everything :))
        default = potato;

        # Normally the rebuild command looks for 'nixos' instead of the 'default' I defined above
        # So.. I point the system in the right direction :))

        nixos = potato; # this is also potato, just in case :))

      };
      # STANDALONE HOME MANAGER CONFIGURATION (FLAKE-BASED)
      # Command: home-manager switch --flake #user

      homeConfigurations."${userSettings.username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;

        extraSpecialArgs = {
          inherit systemSettings userSettings;
          inherit inputs; # Pass inputs if needed in home.nix
          inherit vars;
          inherit neonix;
        };

        modules = [

          # Home-manager module
          ./home.nix
          #...
        ];
      };
    };

}
