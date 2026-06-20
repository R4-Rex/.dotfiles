{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
let
  vesktop-launcher = pkgs.writeShellScriptBin "vesktop" ''
    #!${pkgs.bash}/bin/bash
    exec ${pkgs.vesktop}/bin/vesktop \
        --enable-features=VaapiVideoDecoder,VaapiVideoEncoder \
        --use-gl=egl \
        --ignore-gpu-blocklist \
        --enable-gpu-rasterization \
        --enable-wayland-ime \
        --ozone-platform-hint=auto \
        --enable-features=WaylandWindowDecorations \
        "$@"
  '';
in
{

  imports = [ inputs.nixcord.homeModules.nixcord ];

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc; # Default
    systemdTarget = "default.target"; # Default
  };

  home.file.".config/discord/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink ./.config/settings.json;
    force = true;
  };

  xdg.desktopEntries.vesktop = {
    name = "Vesktop";
    exec = "${vesktop-launcher}/bin/vesktop";
    icon = "vesktop";
    type = "Application";
    categories = [
      "Network"
      "InstantMessaging"
    ];
    genericName = null;
  };

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    /*
      discord = {
        vencord.enable = false;
        equicord.enable = false;
        krisp.enable = true;
        openASAR.enable = true;
      };
      equicordConfig = {
        mainWindowFrameless = true;
        winNativeTitleBar = false;
        frameless = true;
      };
    */

    vesktop = {
      enable = true;
      settings = {
        hardwareAcceleration = true;
        hardwareVideoAcceleration = true;

        arRPC = true;
        enableSplashScreen = false;
      };
    };

    config = {
      useQuickCss = true;
      disableMinSize = true;
      themes = {
        # local dirs
      };
      enabledThemes = [
      ];
      themeLinks = [
        "https://raw.githubusercontent.com/UserPFP/UserPFP/main/userpfp.theme.css"
      ];
      enabledThemeLinks = [
        "https://raw.githubusercontent.com/UserPFP/UserPFP/main/userpfp.theme.css"
      ];
      #frameless = true; # The client doesnt have any frame
      plugins = {
        alwaysExpandRoles.enable = true;
        betterFolders.enable = true;
        betterGifPicker.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        betterRoleContext.enable = true;
        biggerStreamPreview.enable = true;
        callTimer = {
          enable = true;
          format = "human";
        };
        BlurNSFW.enable = true;
        ClearURLs.enable = true;
        crashHandler.enable = true;
        disableCallIdle.enable = true;
        decor.enable = true;
        dontRoundMyTimestamps.enable = true;
        favoriteEmojiFirst.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        hideMedia.enable = true;
        ircColors = {
          enable = true;
          applyColorOnlyInDms = true;
          applyColorOnlyToUsersWithoutColor = true;
          memberListColors = true;
        };
        loadingQuotes.enable = true;
        imageZoom.enable = true;
        implicitRelationships.enable = true;
        memberCount.enable = true;
        messageClickActions.enable = true;
        messageLogger = {
          enable = true;
          collapseDeleted = true;
          ignoreSelf = true;
          ignoreBots = true;
        };
        messageLatency.enable = true;
        MutualGroupDMs.enable = true;
        newGuildSettings.enable = true;
        noBlockedMessages.enable = true;
        noDevtoolsWarning.enable = true;
        noF1.enable = true;
        noMaskedUrlPaste.enable = true;
        noMosaic.enable = true;
        noPendingCount.enable = true;
        noProfileThemes.enable = true;
        noTypingAnimation.enable = true;
        noUnblockToJump.enable = true;
        OnePingPerDM.enable = true;
        pauseInvitesForever.enable = true;
        petpet.enable = true;
        pictureInPicture.enable = true;
        PinDMs.enable = true;
        platformIndicators.enable = true;
        plainFolderIcon.enable = true;
        #previewMessage.enable = true;
        quickReply.enable = true;
        readAllNotificationsButton.enable = true;
        relationshipNotifier.enable = true;
        replyTimestamp.enable = true;
        ReviewDB.enable = true;
        serverInfo.enable = true;
        showConnections.enable = true;
        showHiddenThings.enable = true;
        showHiddenChannels.enable = true;
        showTimeoutDuration.enable = true;
        silentTyping = {
          enable = true;
          showIcon = true;
        };
        streamerModeOnStream.enable = true;
        startupTimings.enable = true;
        themeAttributes.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        unindent.enable = true;
        unlockedAvatarZoom.enable = true;
        userVoiceShow.enable = true;
        #UserPFP.enable = true;
        USRBG.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        viewIcons.enable = true;
        viewRaw.enable = true;
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        volumeBooster.enable = true;
        webRichPresence.enable = true; # Web RPC doesnt work at the moment
        youtubeAdblock.enable = true;
      };
    };
    quickCss = ''
      @import url('https://stevencaior.github.io/discord_themes/addons/SocialLinks_SourrR34.css');
      @import url('https://raw.githubusercontent.com/lumap/css-snippets/main/make-bios-long.css');
      @import url('https://davart154.github.io/Themes/Snippets/Colored%20Mentions/ColoredMentionsSource.css');
      @import url('https://chloecinders.github.io/visual-refresh-compact-title-bar/desktop.css');
      @import url('https://raw.githubusercontent.com/KrstlSkll69/vc-snippets/main/StageRecolor.css');
      @import url('https://raw.githubusercontent.com/moonself/Vencord-Repos/refs/heads/main/Message%20Actions%20Hover');
              /*
              .winButtons_c38106 {
                display: none !important;
              }
              */
            /* Normal state
                  [href*="youtu.be"],
                  [href*="youtube.com"] {
                      font-weight: 700;
                      background-image: linear-gradient(45deg, #ff0000, #ff0000, #ffffff, #ffffff);
                      background-size: 200% 100%;
                      background-position: 0% 50%;
                      -webkit-background-clip: text;
                      -webkit-text-fill-color: transparent;
                      transition: background-position 0.5s ease, text-shadow 0.3s ease;
                  }

                  /* Interactive hover effect 
                  [href*="youtu.be"]:hover,
                  [href*="youtube.com"]:hover {
                      background-image: linear-gradient(
                          45deg, 
                          #ff0000 0%, 
                          #ff0000 45%, 
                          #ffffff 50%, 
                          #ff0000 55%, 
                          #ff0000 100%
                      );
                      animation: curved-line 0.5s ease-in-out infinite alternate; /* Smooth looping */
                  /*text-shadow: 0px 0px 8px rgba(255, 0, 0, 0.6); /* Subtle glow 
                  //}

                  /* Keyframes for smooth cycling
                  @keyframes curved-line {
                      0% {
                          background-position: 0% 50%;
                      }
                      100% {
                          background-position: 100% 50%;
                      }
                  }
                  */
                  /*

                  [href*="twitch.tv"], [href*="twitch.com"] {
                      color:#b700ff !important;
                      font-weight: 700;
                  }
                  [href*="spotify.com"] {
                      background: -webkit-linear-gradient(80deg, rgb(0, 255, 34), rgb(68, 255, 11), #ccffc5);
                      -webkit-background-clip: text;
                      -webkit-text-fill-color: transparent;
                      font-weight: 700;
                  }
                  [href*="discord.com/channels/"] {
                      color:#7289da !important;
                  }
                  [href*="discord.com/channels/"]::before {
                      content:'Jump to Message : ';
                      font-size:16px;
                      font-weight:700;
                      color: #603cff;
                  }
                  [href*="reddit.com"] {
                      color:#e05a0c !important; 
                      font-weight: 700;
                  }
                  [href*="instagram.com/"]{
                      background: -webkit-linear-gradient(80deg, rgb(255, 238, 0), rgb(255, 157, 11), #b700ff);
                      -webkit-background-clip: text;
                      -webkit-text-fill-color: transparent;
                      font-weight: 700;
                  } 
                  [href*="twitter.com/"]{
                      color:#00acee !important;
                      font-weight: 700;
                  }
                  [href*="betterdiscord.app/"],
                  [href*="discord.gg/"] {
                      color:#7289da !important;
                      font-weight: 700;
                  }
                  [href*="github.com"]{
                      color:#00f0a8 !important;
                      font-weight: 700;
                  }

                  [data-list-item-id="guildsnav___home"] {
                      content: url("https://img.pixers.pics/pho_wat(s3:700/FO/10/08/92/84/700_FO10089284_e45d0c5f8754290d97528f7bd3544331.jpg,700,700,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,480,650,jpg)/posters-yin-yang-symbol-on-a-dark-background.jpg.jpg");
                      width: 110%;
                      /* Adjust to 100% of the parent container */
                      /*height: 110%;
                      /* Same as width to maintain proportion */
                      /*object-fit: cover;
                      /* Ensures the image covers the entire area */
                      /*opacity: 0.5;
                      /* Keeps the semi-transparent effect */
                      /*padding: 0;
                      /* Removes any extra space */
                      /*border: transparent;
                      /* Removes the negative border */
                  /*}

                  [data-list-item-id="guildsnav___home"]:hover {
                      opacity: 1;
                      transition: opacity 0.4s ease-in-out, box-shadow 0.4s ease-in-out;
                  }

                  @keyframes rainbow {
                      0% {
                          color: red;
                      }

                      14% {
                          color: orange;
                      }

                      28% {
                          color: yellow;
                      }

                      42% {
                          color: green;
                      }

                      57% {
                          color: blue;
                      }

                      71% {
                          color: indigo;
                      }

                      85% {
                          color: violet;
                      }

                      100% {
                          color: red;
                      }
                  }

                  .username_c19a55:hover {
                      animation: rainbow 3s infinite;
                      /* Adjust duration and timing as needed */
                  /*}

                  /*
                  @keyframes rainbow_list {
                      0% {
                          color: red;
                      }

                      14% {
                          color: orange;
                      }

                      28% {
                          color: yellow;
                      }

                      42% {
                          color: #00ff00;
                      }

                      57% {
                          color: blue;
                      }

                      71% {
                          color: indigo;
                      }

                      85% {
                          color: #ff00ff;
                      }

                      100% {
                          color: red;
                      }
                  }
                  */

                  [class^=chat_] [class*=textArea_] {
                      margin-right: 24px;

                      +[class^=buttons_] {
                          position: absolute;
                          right: 0;
                          background-color: hsl(var(--primary-220-hsl) / 0.5);
                          backdrop-filter: blur(3px);
                          border-radius: 8px;

                          &:not(:hover)>:not(:last-child) {
                              display: none;
                          }

                          /* Send message button fix */
                          &:not(:hover)>[class^=container_] button>div {
                              margin-left: 8px;
                          }
                      }
                  }



                  /*Collapsable Message action*/

                  [class^=buttonsInner_]:not(:hover)>:is(
                    [role=button]:not(:last-child), [class^=separator_]
                  ) {
                    display: none;
                  }
    '';
  };
}
