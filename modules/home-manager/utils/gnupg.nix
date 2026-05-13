{ pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };
  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;

    defaultCacheTtl = 28800; # 8h
    maxCacheTtl = 86400; # 24h

  };
}
