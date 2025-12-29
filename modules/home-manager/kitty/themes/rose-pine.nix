# This is the base rose-pine theme, but with some of my modifications. To, make things pop out ig?

## name: Rosé Pine
## author: mvllow
## license: MIT
## upstream: https://github.com/rose-pine/kitty/blob/main/dist/rose-pine.conf
## blurb: All nixified-natural pine, faux fur and a bit of soho vibes for the classy minimalist
{
programs.kitty = {
  settings = {
    foreground = "#e0def4";
    background = "#191724";
    selection_foreground = "#e0def4";
    selection_background = "#403d52";

    cursor = "#524f67";
    cursor_text_color = "#e0def4";

    url_color = "#c4a7e7";

    active_tab_foreground = "#e0def4";
    active_tab_background = "#26233a";
    inactive_tab_foreground = "#6e6a86";
    inactive_tab_background = "#191724";

    active_border_color = "#31748f";
    inactive_border_color = "#403d52";

    color0  = "#26233a";      # Overlay
    color8  = "#6e6a86";      # Muted

    # Red (#eb5f92)
    color1  = "#eb6f92";      # Love
    color9  = "#eb6f92";      # Love

    # Green (#6feb87)
    color2  = "#6feb87";      # Foam 
    color10 = "#6feb87";      # Foam

    # Yellow (#f6c177)
    color3  = "#f6c177";      # Gold
    color11 = "#f6c177";      # Gold

    # Blue (#9ccfd8)
    color4  = "#1072d2";      # Foam 
    color12 = "#1072d2";      # Foam

    # Magenta (#c4a7e7)
    color5  = "#c4a7e7";      # Iris
    color13 = "#c4a7e7";      # Iris

    # Cyan (#ebbcba)
    color6  = "#6ad3ec";      # Rose
    color14 = "#6ad3ec";      # Rose

    # White (#e0def4)
    color7  = "#e0def4";      # Text
    color15 = "#e0def4";      # Text
  };
};
}
