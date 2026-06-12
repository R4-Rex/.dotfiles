{
  pkgs,
  config,
  lib,
  nur,
  inputs,
  ...
}:
let
  toolbarLayout = {
    placements = {
      "widget-overflow-fixed-list" = [ "fxa-toolbar-menu-button" ];
      "unified-extensions-area" = [
        "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
        "jid1-mnnxcxisbpnsxq_jetpack-browser-action"
        "sponsorblocker_ajay_app-browser-action"
        "_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action"
        "idcac-pub_guus_ninja-browser-action"
        "_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action"
        "atbc_easonwong-browser-action"
        "addon_darkreader_org-browser-action"
        "_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action"
        "_74145f27-f039-47ce-a470-a662b129930a_-browser-action"
        "canvasblocker_kkapsner_de-browser-action"
        "firefox_tampermonkey_net-browser-action"
        "skipredirect_sblask-browser-action"
        "nixpkgs-pr-tracker_tahayassine_me-browser-action"
        "_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action"
        "control-panel-for-youtube_jbscript_dev-browser-action"
      ];
      "nav-bar" = [
        "back-button"
        "forward-button"
        "stop-reload-button"
        "customizableui-special-spring1"
        "vertical-spacer"
        "urlbar-container"
        "ublock0_raymondhill_net-browser-action"
        "customizableui-special-spring2"
        "downloads-button"
        "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
        "unified-extensions-button"
        "reset-pbm-toolbar-button"
        "sidebar-button"
        "_15bdb1ce-fa9d-4a00-b859-66c214263ac0_-browser-action"
        "zotero_chnm_gmu_edu-browser-action"
      ];
      "toolbar-menubar" = [ "menubar-items" ];
      "TabsToolbar" = [ ];
      "vertical-tabs" = [ "tabbrowser-tabs" ];
      "PersonalToolbar" = [ "personal-bookmarks" ];
    };
    seen = [
      "developer-button"
      "ublock0_raymondhill_net-browser-action"
      "screenshot-button"
      "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
      "_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action"
      "idcac-pub_guus_ninja-browser-action"
      "_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action"
      "atbc_easonwong-browser-action"
      "jid1-mnnxcxisbpnsxq_jetpack-browser-action"
      "addon_darkreader_org-browser-action"
      "_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action"
      "_74145f27-f039-47ce-a470-a662b129930a_-browser-action"
      "canvasblocker_kkapsner_de-browser-action"
      "firefox_tampermonkey_net-browser-action"
      "sponsorblocker_ajay_app-browser-action"
      "skipredirect_sblask-browser-action"
      "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
      "reset-pbm-toolbar-button"
      "nixpkgs-pr-tracker_tahayassine_me-browser-action"
      "_15bdb1ce-fa9d-4a00-b859-66c214263ac0_-browser-action"
      "_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action"
      "zotero_chnm_gmu_edu-browser-action"
      "control-panel-for-youtube_jbscript_dev-browser-action"
    ];
    dirtyAreaCache = [
      "nav-bar"
      "vertical-tabs"
      "unified-extensions-area"
      "toolbar-menubar"
      "TabsToolbar"
      "PersonalToolbar"
      "widget-overflow-fixed-list"
    ];
    currentVersion = 24;
    newElementCount = 4;
  };

  horizontalTabsBackup = {
    placements = {
      "widget-overflow-fixed-list" = [ "fxa-toolbar-menu-button" ];
      "unified-extensions-area" = [
        "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action"
        "jid1-mnnxcxisbpnsxq_jetpack-browser-action"
        "sponsorblocker_ajay_app-browser-action"
        "_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action"
        "idcac-pub_guus_ninja-browser-action"
        "_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action"
        "atbc_easonwong-browser-action"
        "addon_darkreader_org-browser-action"
        "_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action"
        "_74145f27-f039-47ce-a470-a662b129930a_-browser-action"
        "canvasblocker_kkapsner_de-browser-action"
        "firefox_tampermonkey_net-browser-action"
        "skipredirect_sblask-browser-action"
        "nixpkgs-pr-tracker_tahayassine_me-browser-action"
        "_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action"
        "control-panel-for-youtube_jbscript_dev-browser-action"
      ];
      "nav-bar" = [
        "back-button"
        "forward-button"
        "stop-reload-button"
        "customizableui-special-spring1"
        "vertical-spacer"
        "urlbar-container"
        "ublock0_raymondhill_net-browser-action"
        "customizableui-special-spring2"
        "downloads-button"
        "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
        "unified-extensions-button"
        "reset-pbm-toolbar-button"
        "sidebar-button"
        "_15bdb1ce-fa9d-4a00-b859-66c214263ac0_-browser-action"
        "zotero_chnm_gmu_edu-browser-action"
      ];
      "toolbar-menubar" = [ "menubar-items" ];
      "TabsToolbar" = [
        "firefox-view-button"
        "tabbrowser-tabs"
        "new-tab-button"
        "alltabs-button"
      ];
      "vertical-tabs" = [ ];
      "PersonalToolbar" = [ "personal-bookmarks" ];
    };
    seen = [
      "developer-button"
      "ublock0_raymondhill_net-browser-action"
      "screenshot-button"
      "_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action"
      "idcac-pub_guus_ninja-browser-action"
      "_0d7cafdd-501c-49ca-8ebb-e3341caaa55e_-browser-action"
      "atbc_easonwong-browser-action"
      "jid1-mnnxcxisbpnsxq_jetpack-browser-action"
      "addon_darkreader_org-browser-action"
      "_7fc8ef53-24ec-4205-87a4-1e745953bb0d_-browser-action"
      "_74145f27-f039-47ce-a470-a662b129930a_-browser-action"
      "canvasblocker_kkapsner_de-browser-action"
      "firefox_tampermonkey_net-browser-action"
      "sponsorblocker_ajay_app-browser-action"
      "skipredirect_sblask-browser-action"
      "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
      "reset-pbm-toolbar-button"
      "nixpkgs-pr-tracker_tahayassine_me-browser-action"
      "_15bdb1ce-fa9d-4a00-b859-66c214263ac0_-browser-action"
      "_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action"
      "zotero_chnm_gmu_edu-browser-action"
      "control-panel-for-youtube_jbscript_dev-browser-action"
    ];
    dirtyAreaCache = [
      "nav-bar"
      "vertical-tabs"
      "unified-extensions-area"
      "toolbar-menubar"
      "TabsToolbar"
      "PersonalToolbar"
      "widget-overflow-fixed-list"
    ];
    currentVersion = 24;
    newElementCount = 4;
  };

  horizontalTabstrip = [
    "firefox-view-button"
    "tabbrowser-tabs"
    "new-tab-button"
    "alltabs-button"
  ];

  navBarWhenVerticalTabs = [
    "back-button"
    "forward-button"
    "stop-reload-button"
    "customizableui-special-spring1"
    "vertical-spacer"
    "urlbar-container"
    "ublock0_raymondhill_net-browser-action"
    "customizableui-special-spring2"
    "downloads-button"
    "jid0-adyhmvsp91nuo8prv0mn2vkeb84_jetpack-browser-action"
    "unified-extensions-button"
    "reset-pbm-toolbar-button"
    "sidebar-button"
    "_15bdb1ce-fa9d-4a00-b859-66c214263ac0_-browser-action"
    "zotero_chnm_gmu_edu-browser-action"
  ];
in
{
  imports = [
    nur.repos.moredhel.modules.homeManager
  ];

  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";
    profiles = {
      "rex" = {
        #id = 0;
        isDefault = true; # "true if profile ID is 0"
        settings = {
          "browser.startup.page" = 1; # Blank page on startup
          "privacy.trackingprotection.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "browser.ai.control.sidebarChatbot" = false;
          "sidebar.verticalTabs.dragToPinPromo.dismissed" = false;
          "browser.toolbarbuttons.introduced.sidebar-button" = true;

          "browser.uiCustomization.state" = builtins.toJSON toolbarLayout;
          "browser.uiCustomization.horizontalTabsBackup" = builtins.toJSON horizontalTabsBackup;
          "browser.uiCustomization.horizontalTabstrip" = builtins.toJSON horizontalTabstrip;
          "browser.uiCustomization.navBarWhenVerticalTabs" = builtins.toJSON navBarWhenVerticalTabs;

          "browser.aboutConfig.showWarning" = false;

          # Theme
          "browser.theme.content-theme" = 0; # 0 -> force dark
          "browser.theme.toolbar-theme" = 0;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "services.sync.prefs.sync.extensions.activeThemeID" = false;

          "extensions.autoDisableScopes" = 0; # prevents new extension check

          # Startup anoyyances
          "browser.disableResetPrompt" = true;
          "browser.download.panel.shown" = true;
          "browser.feeds.showFirstRunUI" = false;
          "browser.messaging-system.whatsNewPanel.enabled" = false;
          "browser.rights.3.shown" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "browser.startup.homepage_override.mstone" = "ignore";
          "browser.uitour.enabled" = false;
          #"startup.homepage_override_url" = "";
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "browser.bookmarks.restore_default_bookmarks" = false;
          "browser.bookmarks.addedImportButton" = true;
          "browser.toolbars.bookmarks.visibility" = "never";

          # New Tab Stuff
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;

          # Save password
          "signon.rememberSignons" = false;

          # Vertical Tabs
          "sidebar.verticalTabs" = true;
          "sidebar.revamp" = true;
          "sidebar.main.tools" = ''["history","bookmarks"],{446900e4-71c2-419f-a6a7-df9c091e268b}'';
          "toolkit.tabbox.switchByScrolling" = true;
        };
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            privacy-badger
            sponsorblock
            skip-redirect

            bitwarden

            tampermonkey

            control-panel-for-youtube

            refined-github
          ];
          settings."uBlock0@raymondhill.net".settings = {
            selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-quick-fixes"
            ];
          };
        };
        search = {
          default = "ddg";
          force = true;
          engines = {

          };
        };
        bookmarks = { };
      };
    };
    policies = {

      AppAutoUpdate = false;

      AutofillAddressEnabled = false;

      AutofillCreditCardEnabled = false;

      BackgroundAppUpdate = false;

      CaptivePortal = false;

      DisableAppUpdate = true;

      DisableBuiltinPDFViewer = true;

      DisableFirefoxScreenshots = true;

      DisableFirefoxStudies = true;

      DisableFormHistory = true;

      DisableMasterPasswordCreation = true;

      DisablePasswordReveal = true;

      DisablePocket = true;

      DisableProfileRefresh = true;

      DisableSetDesktopBackground = true;

      DisableTelemetry = true;

      DisplayBookmarksToolbar = false;

      DisplayMenuBar = "never";

      DontCheckDefaultBrowser = true;

      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = false; # true -> force light theme
        EmailTracking = true;
      };

      ExtensionSettings = {
        "*" = {
          #default_area = "menupanel";
          installation_mode = "allowed";
        };
      };

      FirefoxHome = {
        Pocket = false;
        Snippets = false;
      };

      GenerativeAI = {
        Enabled = false;
        Chatbot = false;
        LinkPreviews = false;
        TabGroups = false;
        Locked = false;
      };

      HardwareAcceleration = true;

      LegacyProfiles = true;

      ManualAppUpdateOnly = true;

      NetworkPrediction = false;

      OfferToSaveLogins = false;

      OfferToSaveLoginsDefault = false;

      PDFjs.Enabled = false;

      PasswordManagerEnabled = false;

      PictureInPicture.Enabled = true;

      PrimaryPassword = false;

      PromptForDownloadLocation = false;

      SearchEngines = {
        Default = "DuckDuckGo";
        Remove = [
          "Google"
          "Amazon.com"
          "Bing"
          "Wikipedia"
        ]; # Engines to remove
        #PreventInstalls = true; # Stop users from adding new engines
      };
      /*
                SanitizeOnShutdown = {
                  Cache = true;
                  Cookies = false;
                  Downloads = true;
                  FormData = true;
                  History = false;
                  OfflineApps = true;
                  Sessions = false;
                };
      */
    };
  };
}
