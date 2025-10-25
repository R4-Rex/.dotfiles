{config, pkgs, ...}:

{
  home.packages = with pkgs; [
    diff-so-fancy          # Better diff output
    meld                   # GUI diff/merge tool
  ];

  programs.git.extraConfig = {
    # Use diff-so-fancy for better diffs
    core.attributesfile = "~/.gitattributes";
    
    # Diff configuration
    diff.algorithm = "histogram";
    diff.indentHeuristic = true;
    diff.tool = "meld";
    
    # Merge configuration
    merge.tool = "meld";
    merge.conflictstyle = "zdiff3";
    
    # Difftool configuration
    difftool.prompt = false;
    difftool.meld.cmd = "meld $LOCAL $REMOTE";
    
    # Mergetool configuration
    mergetool.prompt = false;
    mergetool.keepBackup = false;
    mergetool.meld.cmd = "meld $LOCAL $BASE $REMOTE --output $MERGED";
  };

  # Git attributes for better diffing
  home.file.".gitattributes".text = ''
    *.diff    diff=diff
    *.patch   diff=diff
    *.css     diff=css
    *.html    diff=html
    *.java    diff=java
    *.js      diff=javascript
    *.json    diff=json
    *.md      diff=markdown
    *.py      diff=python
    *.rb      diff=ruby
    *.xml     diff=xml
    *.yaml    diff=yaml
    *.yml     diff=yaml
  '';
}
