{
  programs.niri.settings.window-rules = [
    {
      matches = [
        { app-id = "^floorp$"; }
      ];
      open-on-workspace = "browser";
      open-maximized = true;
    }
    {
      matches = [
        { app-id = "^.zed-editor$"; }
      ];
      open-on-workspace = "coding";
      open-fullscreen = true;
    }
  ];
}
