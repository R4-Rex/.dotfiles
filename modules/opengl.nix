{config, pkgs, ...}:

{

services.xserver.videoDrivers = ["amdgpu"];

hardware.graphics = {
  enable = true;

  extraPackages = with pkgs; [
  
  libva
  libva-utils
  
  mesa
  
  libva
  libva-utils
  
  vulkan-loader
  vulkan-tools
  vulkan-validation-layers

  amdvlk
  rocmPackages.clr.icd
   ];
   extraPackages32 = with pkgs; [
      # 32-bit support for compatibility
      driversi686Linux.mesa
      driversi686Linux.amdvlk
    ];
   };
}
