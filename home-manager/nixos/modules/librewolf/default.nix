let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  # To add additional extensions, find it on addons.mozilla.org, find
  # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
  # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid

  extensions = [
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
    (extension "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack")
    (extension "clearurls" "{74145f27-f039-47ce-a470-a662b129930a}")
    (extension "istilldontcareaboutcookies" "idcac-pub@guus.ninja")
    (extension "return-youtube-dislikes" "{762f9885-5a13-4abd-9c77-433dcd38b8fd}")
    (extension "sponsorblock" "sponsorBlocker@ajay.app")
    (extension "don-t-fuck-with-paste" "DontFuckWithPaste@raim.ist")
    (extension "hide-youtube-shorts" "{88ebde3a-4581-4c6b-8019-2a05a9e3e938}")
  ];
  mkProfile = { id, extra ? { } }: {
      inherit id;
      extensions.force = true;
  
      settings = {
        "extensions.autoDisableScopes" = 0;
        "extensions.pocket.enabled" = false;
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        "widget.use-xdg-desktop-portal.location" = 1;
        "widget.use-xdg-desktop-portal.native-messaging" = 1;
        "widget.use-xdg-desktop-portal.open-uri" = 1;
        "widget.use-xdg-desktop-portal.settings" = 1;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.generation.enabled" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "userChrome.compatibility.theme" = false;
        "layout.css.prefers-color-scheme.content-override" = 0;
        "browser.download.autohideButton" = true;
        "privacy.resistFingerprinting" = false;
        "browser.profiles.enabled" = false;
        "privacy.sanitize.sanitizeOnShutdown" = false;
        "browser.download.useDownloadDir" = true;
        "services.sync.engine.addons" = false;
      };
    } // extra;
in
{
  programs.librewolf = {
    enable = true;
    policies = {
      ExtensionSettings = builtins.listToAttrs extensions;
    };
    profiles = {
      Personal = mkProfile {
        id = 0;
        extra.isDefault = true;
      };
    };
  };
  stylix.targets.librewolf = {
    enable = true;
    profileNames = [ "Personal" ];
    firefoxGnomeTheme.enable = false;
    colorTheme.enable = true;
  };

}
