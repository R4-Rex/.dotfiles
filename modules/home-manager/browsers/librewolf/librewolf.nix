 {config,  pkgs, ...}: {
 
 imports = [
    
    ./toolbar.nix
 
 ];

  programs.librewolf = {
    enable = true;
    settings = {
     "webgl.disabled" = false; # Enables WebGL, which might be needed for some websites and applications :cite[1]:cite[8].
    
     # Sync
     "identity.fxaccounts.enabled" = true;

     # Vertical Tabs
      "sidebar.verticalTabs" = true; # Enable vertical tabs
      "sidebar.revamp" = true;       # New sidebar design
      
     # Url & Search Bar
     "browser.urlbar.suggest.bookmark" = false; # Don't suggest bookmarks
       "browser.urlbar.suggest.openpage" = false; # Don't suggest open pages
       "browser.urlbar.suggest.topsites" = false; # Don't suggest top sites
   
     # Mouse Scroll
      "general.autoScroll" = true; # Middle click auto-scroll
       "toolkit.tabbox.switchByScrolling" = true; # Switch tabs by scrolling
     
     # Stylesheet
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    
    };
  };
}
