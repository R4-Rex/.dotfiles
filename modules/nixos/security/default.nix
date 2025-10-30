{
  imports = [

    ./sops.nix # Sops Config

    # ./sops-secrets.nix # The encrypted content as a module option

    ./age.nix # Age Software config
    
    ./gnupg.nix

  ];
}
