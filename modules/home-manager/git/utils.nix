{config, pkgs, ...}:

{
  home.packages = with pkgs; [

    delta

    gnupg
    git-crypt

  ];

}
