{config, pkgs, ...}:

{
  # amdgpu loads early
  boot.initrd.kernelModules = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
    
    # VA-API for video acceleration
    libva
    libva-utils
  
    # Vulkan Support
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    amdvlk

    # ROCm for OpenCL/compute
    rocmPackages.clr.icd
   ];
    extraPackages32 = with pkgs; [
      # 32-bit support for compatibility
      driversi686.linux.mesa
      driversi686.linux.amdvlk
    ];
   };
}
