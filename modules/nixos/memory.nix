{ config, pkgs, ... }:
{
  boot.kernelModules = [ "zram" ];
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 100;
  };

  boot.kernelParams = [
    "vm.swappiness=180" # Use swap more(100)/less(0) aggressively
    "vm.vfs_cache_pressure=50" # Clear cache more(100)/less(0) aggressively
    "vm.dirty_ratio=10" # Write to disk sooner(0)
    "vm.dirty_background_ratio=3"
  ];
  /*
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 8 * 1024;
      }
    ];
  */
}
