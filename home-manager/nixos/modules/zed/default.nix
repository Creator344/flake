{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;

    # This populates the userSettings "auto_install_extensions"
    extensions = [
      "nix"
      "toml"
      "make"
    ];

    # Everything inside of these brackets are Zed options
    userSettings = {
      assistant = {
        enabled = true;
        version = "2";
        default_open_ai_model = null;

        # Provider options:
        # - zed.dev models (claude-3-5-sonnet-latest) requires GitHub connected
        # - anthropic models (claude-3-5-sonnet-latest, claude-3-haiku-latest, claude-3-opus-latest) requires API_KEY
        # - copilot_chat models (gpt-4o, gpt-4, gpt-3.5-turbo, o1-preview) requires GitHub connected
        default_model = {
          provider = "copilot_chat";
          model = "claude-5-5-opus-latest";
        };
      };

      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      hour_format = "hour24";
      auto_update = false;

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = true;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [
              ".env"
              "env"
              ".venv"
              "venv"
            ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "alacritty";
        };
        font_family = "FiraCode Nerd Font";
        font_features = null;
        font_size = null;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };

      languages = {

      };

      vim_mode = false;

      # Tell Zed to use direnv and direnv can use a flake.nix environment
      load_direnv = "shell_hook";
      base_keymap = "VSCode";

      show_whitespaces = "all";
      ui_font_size = 16.0;
      buffer_font_size = 16.0;
    };
  };
}
