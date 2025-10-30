{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    
    age
    ssh-to-age

  ];
}
