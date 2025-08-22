# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, systemSettings, userSettings,... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../modules/packages.nix
      ../modules/opengl.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = systemSettings.hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Time zone.
  time.timeZone = systemSettings.timezone;

  # Select internationalisation properties.
  i18n.defaultLocale = systemSettings.locale;

  i18n.extraLocaleSettings = { 
  
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  services.xserver.enable = true;
   services.displayManager.sddm.enable = true;
   services.displayManager.sddm.wayland.enable = true;
   services.displayManager.sddm.theme = "where_is_my_sddm_theme";


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = "Rex";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Hyprland
  
  programs.hyprland = {
  enable = true;
  xwayland.enable = true;
  };

  environment.sessionVariables = {
   WLR_NO_HARDWARE_CURSORS = "1";
   NIXOS_OZONE_WL = "1";
};

#  services.xserver.videoDrivers = ["amdgpu"];

#  hardware = {
   # OpenGl
#   graphics = {
#   enable = true;

#   extraPackages = with pkgs; [
#    mesa
#    vulkan-loader
#    vulkan-tools
#    vulkan-validation-layers
#   ];
# };
#};

   xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

   nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
#  environment.systemPackages = with pkgs; [
#    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
#    wget
#    kitty
#    waybar
#    dunst
#    libnotify
#    swww
#    rofi-wayland
#    git
#    brave
#    firefox
#  ];

  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
