{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nix-index
    comma
  ];
}
