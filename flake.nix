{
  description = "Home Manager config with flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    let
      system = "x86_64-linux";
      username = "rex";
      pkgs = import nixpkgs {inherit system;}
     in{
       homeConfiguration.${username} = home-manager.lib.homeManagerConfiguratiob {

       inherit pkgs;
       modules = [./home/default.nix];
       extraSpecialArgs = {inherit username;};
      };

     };
    #packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    #packages.x86_64-linux.default = self.packages.x86_64-linux.hello;

  };
}
