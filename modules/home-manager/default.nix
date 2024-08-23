{ inputs }:{ pkgs, config, ... }: {
  home.stateVersion = "23.11";
  home.sessionVariables = {
    CLICOLOR = 1;
    EDITOR = "nvim";
    VISUAL = "nvim";
    LC_CTYPE = "en_US.UTF-8";
    GPG_TTY = "$(tty)";
  };
  home.packages = with pkgs; [
    awscli2
    cargo
    curl
    doit
    exiv2
    exiftool
    fastfetch
    ffmpeg
    fd
    fnm
    gnupg
    go
    hyperfine
    jq
    jhead
    parallel
    pinentry_mac
    pipx
    python3
    ripgrep
    ssm-session-manager-plugin
    wget
    yt-dlp
  ];

  programs.git = {
    enable = true;
    userName = "Alex Stanciu";
    userEmail = "ag.stanciu@gmail.com";
    signing = {
      key = "C00A4B382F09CAD51E264FBAD37D8E3F3ADB8E63";
      # signByDefault = true;
    };
    aliases = {
      cim = "commit -m";
      lg = "log --pretty=format:%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn] --decorate --date=short";
      rbi = "rebase -i";
      st = "status -sb";
    };
  };

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(fnm env --use-on-cd)"
      [[ -e "''${HOME}/.workrc" ]] && source "''${HOME}/.workrc"

      autoload -U edit-command-line
      zle -N edit-command-line
      bindkey '^xe' edit-command-line
      bindkey '^x^e' edit-command-line
    '';
    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls --color=auto";
      nixsw = "darwin-rebuild switch --flake ~/nixcfg/.#";
      nixup = "pushd ~/nixcfg; nix flake update; popd";
      v = "nvim";
    };
    history = {
      size = 100000;
      ignoreDups = true;
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  home.file.".config/starship.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixcfg/modules/home-manager/configs/starship.toml";
    recursive = true;
  };

  # Neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    package = pkgs.neovim;
  };
  home.file.".config/nvim" = {
    # source = config.lib.file.mkOutOfStoreSymlink ./configs/config/nvim;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixcfg/modules/home-manager/configs/config/nvim";
    recursive = true;
  };

  # Config files
  # home.file.".config/wezterm/wezterm.lua".source = ./dotfiles/wezterm.lua;
  # home.file.".config/tmux" = {
  #   # source = ./configs/config/tmux/tmux.conf;
  #   source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixcfg/modules/home-manager/configs/config/tmux";
  #   recursive = true;
  # };

  home.file.".config/kitty" = {
    # source = ./configs/config/kitty;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixcfg/modules/home-manager/configs/config/kitty";
    recursive = true;
  };
  home.file.".hushlogin".source = ./configs/.hushlogin;

  home.file.".config/zed" = {
    # source = ./configs/config/kitty;
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixcfg/modules/home-manager/configs/config/zed";
    recursive = true;
  };
}
