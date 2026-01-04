{ config, pkgs, lib, ... }:
let

bibataHyprcursor = pkgs.stdenvNoCC.mkDerivation {
  name = "bibata-hyprcursor";
  src = pkgs.fetchurl {
    url = "https://github.com/LOSEARDES77/Bibata-Cursor-hyprcursor/releases/download/1.0/hypr_Bibata-Modern-Classic.tar.gz";
    hash = "sha256-+ZXnbI3bBLcb0nv2YW3eM/tK4dsraNM4UAO9BpSqfXk=";
  };
  
  installPhase = ''
    mkdir -p $out/share/icons/Bibata-Modern-Classic
    tar -xzf $src -C $out/share/icons/Bibata-Modern-Classic

    cp $out/share/icons/Bibata-Modern-Classic/hyprcursors/left_ptr.hlc \
    $out/share/icons/Bibata-Modern-Classic/hyprcursors/default.hlc

    '';
  };

in {
  home.packages = [ 
    bibataHyprcursor
  ];

# Set cursor theme for user sessions
  home.pointerCursor = {
    package = bibataHyprcursor;
    name = "Bibata-Modern-Classic";
    size = 28;
    gtk.enable = true;
    x11.enable = true;
  };
}
