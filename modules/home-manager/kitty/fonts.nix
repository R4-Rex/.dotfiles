{config, pkgs, ...}:
{
  programs.kitty.settings = {
  
  font_family = "JetbrainsMono Nerd Font";
  
  font_features = "JetbriansMonoNF-Reg +calt +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08"; #fyi calt+ enables ligeratures. and then its variants, +ss01 > +ss08 
  
  };
}
