{config, pkgs, ...}:

{
  home.packages = with pkgs; [
  ];

  programs.git.settings = {
    core.attributesfile = "~/.gitattributes";
    
    # Diff configuration
    diff.algorithm = "histogram";
    diff.indentHeuristic = true;
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
