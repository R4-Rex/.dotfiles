{ config, pkgs, ... }:

{
  # zram - Compressed RAM (more efficient than swap)
  zramSwap = {
    enable = true;
    memoryPercent = 25;  # 2GB of 8GB for zram
    algorithm = "zstd";  # Best compression
  };

# Kernel memory parameters
  boot.kernelParams = [
    # Memory management
    "vm.swappiness=10"          # Use swap less aggressively
    "vm.vfs_cache_pressure=100" # Clear cache more aggressively
    "vm.dirty_ratio=15"         # Write to disk sooner
    "vm.dirty_background_ratio=5"
  ];

  # Systemd memory limits for critical services
  systemd.extraConfig = ''
    DefaultMemoryMax=6G
    DefaultMemorySwapMax=2G
  '';
}
