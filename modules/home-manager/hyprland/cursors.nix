{ config, pkgs, lib, ... }:
let

bibataHyprcursor = pkgs.stdenvNoCC.mkDerivation {
  name = "bibata-hyprcursor";
  src = pkgs.fetchurl {
    url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Ice.tar.gz";
    hash = "sha256-3ttG6Hnr9TPtvIiIbQrsSodu5iZV4Y62xaKvQmkdLPg=";
  };
  
  installPhase = ''
    mkdir -p $out/share/icons/Bibata-Modern-Ice
    tar -xzf $src -C $out/share/icons/Bibata-Modern-Ice

    cp $out/share/icons/Bibata-Modern-Ice/hyprcursors/left_ptr.hlc \
    $out/share/icons/Bibata-Modern-Ice/hyprcursors/default.hlc

    '';
  };

in {
  home.packages = [ 
    bibataHyprcursor
    pkgs.bibata-cursors
  ];

# Set cursor theme for user sessions
  home.pointerCursor = {
    package = bibataHyprcursor;
    name = "Bibata-Modern-Ice";
    size = 28;
    hyprcursor = {
      enable = true;
      };
    gtk.enable = true;
    x11.enable = true;
  };
}
