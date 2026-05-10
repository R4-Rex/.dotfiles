{ config, pkgs, ... }:
{
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
    wireplumber = {
      enable = true;
      /* # alc3220 was the soundcard i was able to detect, which was causing the issue
      extraConfig = {
        "alc3220-fix" = {
          "monitor.alsa.rules" = [
            {
              matches = [ { "device.name" = "alsa_card.pci-*-0"; } ];
              actions = {
                update-props = {
                  "api.alsa.auto-mute" = false;
                  "api.alsa.soft-mixer" = true;
                  # "api.alsa.disable-mixer-path" = true;
                };
              };
            }
          ];
        };
      };
      */
    };
/*
  # the code below wasnt the solution, its just there.. if i need it.
  # Strong post-start restore (runs after WirePlumber)
    systemd.user.services."alsa-force-restore" = {
      description = "Force ALSA state after WirePlumber for ALC3220";
      after = [ "wireplumber.service" ];
      wantedBy = [ "pipewire.service" "graphical-session.target" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        ExecStart = pkgs.writeShellScript "alsa-force-restore" ''
          sleep 3
          ${pkgs.alsa-utils}/bin/amixer -c 0 sset 'Auto-Mute Mode' Disabled
          ${pkgs.alsa-utils}/bin/amixer -c 0 sset Speaker unmute
          ${pkgs.alsa-utils}/bin/amixer -c 0 sset 'Speaker+LO' unmute
          ${pkgs.alsa-utils}/bin/amixer -c 0 sset 'Line Out' unmute
          ${pkgs.alsa-utils}/bin/amixer -c 0 sset Master unmute
          ${pkgs.alsa-utils}/bin/alsactl store
        '';
      };
    };
*/
    };
  environment.systemPackages = with pkgs; [
    alsa-utils
  ];
}
