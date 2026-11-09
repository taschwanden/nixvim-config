{ pkgs, ... }:
{
  # ImageMagick CLI (`magick`) is required by image.nvim's default processor
  extraPackages = [ pkgs.imagemagick ];

  plugins = {
    web-devicons = {
      enable = true;
    };

    # Buffer bar
    bufferline = {
      enable = true;
    };

    # Status bar
    lualine = {
      enable = true;
    };

    # Make `nvim .` look prettier, i.e. it prettifies the file tree view of nvim
    oil = {
      enable = true;
    };

    # Image preview support
    image = {
      enable = true;

      # The kitty graphics protocol only works in a few terminals (kitty, ghostty,
      # wezterm); elsewhere (e.g. alacritty) images silently fail to render. Only
      # call setup() when the terminal advertises support. Env vars are inherited
      # through tmux, so this also works inside a tmux session started from kitty.
      luaConfig = {
        pre = ''
          local term_supports_images = vim.env.KITTY_WINDOW_ID ~= nil
            or vim.env.GHOSTTY_RESOURCES_DIR ~= nil
            or vim.env.TERM == "xterm-kitty"
            or vim.env.TERM == "xterm-ghostty"
            or vim.env.TERM_PROGRAM == "WezTerm"
            or vim.env.TERM_PROGRAM == "ghostty"
          if term_supports_images then
        '';
        post = "end";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
    {
      mode = "n";
      key = "<S-n>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options = {
        desc = "Cycle to next buffer";
      };
    }
    {
      mode = "n";
      key = "<S-e>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options = {
        desc = "Cycle to previous buffer";
      };
    }
  ];
}
