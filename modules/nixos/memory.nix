{ config, pkgs, ... }:

{
  # zram - Compressed RAM (more efficient than swap)
  zramSwap = {
    enable = true;
    memoryPercent = 50;  # 4GB of 8GB for zram
    algorithm = "zstd";
    priority = 100;
  };

# Kernel memory parameters
  boot.kernelParams = [
    # Memory management
    "vm.swappiness=60"          # Use swap more(100)/less(0) aggressively
    "vm.vfs_cache_pressure=100" # Clear cache more aggressively
    "vm.dirty_ratio=20"         # Write to disk sooner
    "vm.dirty_background_ratio=5"
  ];

# Disk Based Swap

  swapDevices = [
  {
    device = "/swapfile";
    size = 8 * 1024; # 8GB swap
    priority = 50;
  }
  ];

}
