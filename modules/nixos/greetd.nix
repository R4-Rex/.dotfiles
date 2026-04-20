{pkgs,inputs, userSettings,...}:

let
  tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
  hyprland-session = "${pkgs.hyprland}/share/wayland-sessions";
#  x11-sessions = "/run/current-system/sw/share/xsessions";

in {
  services.greetd = {
    enable = true;
    settings = {

/*
    Feature?
    First boot: Uses initial_session (auto-login, no password)

    After logout: Uses default_session (shows greeter, requires password)

    Subsequent boots: Uses default_session (always shows greeter)

      initial_session = {

      command = "hyprland";
      user = "${userSettings.username}";

      };
*/
/*
  use this flag when using xsession

  --xsessions ${x11-sessions}

*/
      default_session = {
        command = "${tuigreet} --time --remember --remember-session --sessions ${hyprland-session} --window-padding 2";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this, errors will spam on screen

    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
