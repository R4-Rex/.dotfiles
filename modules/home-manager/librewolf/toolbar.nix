{config, pkgs, ...}: {

  programs.librewolf = {

  settings = {
    "browser.uiCustomization.state" = ''
        {"placements":{"widget-overflow-fixed-list":["fxa-toolbar-menu-button"],"unified-extensions-area":["jid1-mnnxcxisbpnsxq_jetpack-browser-action","sponsorblocker_ajay_app-browser-action","_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action","idcac-pub_guus_ninja-browser-action","_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action","atbc_easonwong-browser-action","addon_darkreader_org-browser-action","_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","canvasblocker_kkapsner_de-browser-action","firefox_tampermonkey_net-browser-action","skipredirect_sblask-browser-action"],"nav-bar":["sidebar-button","back-button","forward-button","stop-reload-button","customizableui-special-spring1","vertical-spacer","urlbar-container","ublock0_raymondhill_net-browser-action","customizableui-special-spring2","downloads-button","jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","unified-extensions-button","alltabs-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":[],"vertical-tabs":["tabbrowser-tabs"],"PersonalToolbar":["personal-bookmarks"]},"seen":["developer-button","ublock0_raymondhill_net-browser-action","screenshot-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action","idcac-pub_guus_ninja-browser-action","_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action","atbc_easonwong-browser-action","jid1-mnnxcxisbpnsxq_jetpack-browser-action","addon_darkreader_org-browser-action","_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action","_74145f27-f039-47ce-a470-a662b129930a_-browser-action","canvasblocker_kkapsner_de-browser-action","firefox_tampermonkey_net-browser-action","sponsorblocker_ajay_app-browser-action","skipredirect_sblask-browser-action","jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"],"dirtyAreaCache":["nav-bar","vertical-tabs","unified-extensions-area","toolbar-menubar","TabsToolbar","PersonalToolbar","widget-overflow-fixed-list"],"currentVersion":23,"newElementCount":3}
      '';
 
    };
  };
}
