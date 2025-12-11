{config, pkgs, ...}:

{
  programs.git.settings.alias = {
    
    co = "checkout";
    br = "branch";
    ci = "commit";
    st = "status -sb";
    unstage = "reset HEAD --";
    last = "log -1 HEAD";
    
    # Enhanced status
    stat = "status -s";
    
    # Better logging
    lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    lol = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
    lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
    
    # Branch management
    recent = "branch --sort=-committerdate";
    delete-merged = "!git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d";
    
    # Staging
    aa = "add -A";
    ap = "add -p";
    
    # Commit fixes
    amend = "commit --amend --no-edit";
    reamend = "commit --amend";
    
    # Diff enhancements
    dc = "diff --cached";
    dh = "diff HEAD";
    
    # Remote
    rom = "!git fetch && git rebase origin/main";
  };
}
