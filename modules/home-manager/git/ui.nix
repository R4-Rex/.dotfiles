{config, pkgs, ...}:

{
  programs.git.extraConfig = {
    # Colors everywhere
    color.ui = "auto";
    
    # Branch colors
    color.branch.current = "yellow reverse";
    color.branch.local = "yellow";
    color.branch.remote = "green";
    
    # Diff colors
    color.diff.meta = "yellow bold";
    color.diff.frag = "magenta bold";
    color.diff.old = "red bold";
    color.diff.new = "green bold";
    color.diff.whitespace = "red reverse";
    
    # Status colors
    color.status.added = "green";
    color.status.changed = "yellow";
    color.status.untracked = "red";
    color.status.updated = "green";
    
    # Pretty format for various commands
    pretty.default = "%C(yellow)%h%Creset -%C(red)%d%Creset %s %C(green)(%cr) %C(bold blue)<%an>%Creset";
    
    # Delta configuration (syntax-highlighting pager)
    delta = {
      features = "side-by-side line-numbers decorations";
      syntax-theme = "Dracula";
      plus-style = "syntax #012800";
      minus-style = "syntax #340001";
      decorations = {
        commit-decoration-style = "bold yellow box ul";
        file-style = "bold yellow ul";
        file-decoration-style = "none";
      };
    };
    
    # Interactive rebase UI
    rebase.autoSquash = true;
    rebase.autoStash = true;
  };
}
