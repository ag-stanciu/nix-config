{ pkgs, ... }: {
  home.stateVersion = "23.11";
  home.sessionVariables = {
    CLICOLOR = 1;
    EDITOR = "nvim";
    LC_CTYPE = "en_US.UTF-8";
    GPG_TTY = "$(tty)";
  };
  home.packages = with pkgs; [
    awscli2
    cargo
    curl
    fd
    fnm
    go
    gnupg
    hyperfine
    jq
    python3
    ripgrep
    rustc
    tmux
    wget
  ];

  programs.git = {
    enable = true;
    userName = "Alex Stanciu";
    userEmail = "ag.stanciu@gmail.com";
    aliases = {
      st = "status -sb";
      cim = "commit -m";
      lg = "log --pretty=format:'%C:(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]' --decorate --date=short";
    };
  };

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      eval "$(fnm env --use-on-cd)"
      [[ -e "''${HOME}/.workrc" ]] && source "''${HOME}/.workrc"
    '';
    shellAliases = {
      grep = "grep --color=auto";
      ls = "ls --color=auto";
      nixsw = "darwin-rebuild switch --flake ~/nixcfg/.#";
      nixup = "pushd ~/nixcfg; nix flake update; popd";
      v = "nvim";
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
  home.file.".config/starship.toml".source = ./configs/starship.toml;

  # Neovim
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };
  home.file.".config/nvim" = {
    source = ./configs/config/nvim;
    recursive = true;
  };

  # Config files
  # home.file.".config/wezterm/wezterm.lua".source = ./dotfiles/wezterm.lua;
  home.file.".config/tmux/tmux.conf".source = ./configs/config/tmux/tmux.conf;
  home.file.".config/kitty" = {
    source = ./configs/config/kitty;
    recursive = true;
  };
  home.file.".hushlogin".source = ./configs/.hushlogin;
}
