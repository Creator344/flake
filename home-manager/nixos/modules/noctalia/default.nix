{
  imports = [
    ./theme.nix
  ];
  programs.noctalia = {
    enable = true;
    settings = {
      shell = {
        polkit_agent.enable = true;
      };
    };
  };

}
