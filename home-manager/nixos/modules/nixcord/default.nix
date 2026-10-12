{
  programs.nixcord = {
    enable = true;
    discord.enable = false;
    equibop = {
      enable = true;
    };
    config = {
      plugins = {
        blurNsfw.enable = true;
        callTimer.enable = true;
        clearUrls.enable = true;
        crashHandler.enable = true;
        disableDeepLinks.enable = true;
        equibopStreamFixes.enable = true;
        equicordHelper.enable = true;
        equicordToolbox.enable = true;
        fakeNitro.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        gameActivityToggle.enable = true;
        memberCount.enable = true;
        mutualGroupDms.enable = true;
        noNitroUpsell.enable = true;
        noProfileThemes.enable = true;
        petpet.enable = true;
        questify.enable = true;
        showHiddenChannels.enable = true;
        volumeBooster.enable = true;
        webContextMenus.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
