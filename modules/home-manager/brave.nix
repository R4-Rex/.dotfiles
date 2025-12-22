{ config, pkgs, ...}:
{
  programs.brave = {

    enable = true;

    commandLineArgs = [
      "--use-gl=desktop"
      "--enable-features=VaapiVideoDecoder"
    ];
  };
}
