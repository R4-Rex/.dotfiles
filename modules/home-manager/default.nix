{ config, pkgs, ... }:

{
  imports = [
    ./sh.nix
    ./git.nix
  ];
}
