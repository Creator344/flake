{
  programs.niri.settings.window-rules = [
    {
      geometry-corner-radius =
        let
          radius = 12.0;
        in
        {
          top-left = radius;
          top-right = radius;
          bottom-left = radius;
          bottom-right = radius;
        };
      clip-to-geometry = true;
    }
  ];
}
