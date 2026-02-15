{ pkgs, neonix, ... }:
{
	nixpkgs.overlays = [
		neonix.overlays.default
	];

	home.packages = with pkgs; [
	nvim-pkg
	];
}
