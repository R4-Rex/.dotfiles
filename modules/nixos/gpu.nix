{ config, pkgs, ... }:

{
  # Use radeon driver for R7 250 (not amdgpu)
  boot.initrd.kernelModules = [ "radeon" ];
  boot.kernelModules = [ "radeon" ];

  # Radeon-specific kernel parameters
  boot.kernelParams = [
    # R7 250 stability
    "radeon.dpm=1"              # Enable power management
    "radeon.audio=0"            # Disable HDMI audio (reduces complexity)
    "radeon.sg_display=0"       # Disable scatter-gather display
  ];

  # Mesa with Radeon support
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      mesa
      libva
      vulkan-loader
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    MOZ_DISABLE_RDD_SANDBOX = "1";
  };

}
