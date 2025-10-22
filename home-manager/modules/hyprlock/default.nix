{ ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          path = "./void.png";
        }
      ];
    };
  };
}
