{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ gnupg ];
  
  # System-wide GPG configuration
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
