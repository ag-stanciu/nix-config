{ pkgs, ... }: {
  home.stateVersion = "22.11";
  home.sessionVariables = {
    CLICOLOR = 1;
    EDITOR = "nvim";
    LC_CTYPE = "en_US.UTF-8";
  };
  home.packages = with pkgs; [
    awscli2
    fd
    curl
    ripgrep
    go
    hyperfine
    jq
    wget
    tmux
    rustc
    cargo
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
    shellAliases = {
      ls = "ls --color=auto";
      nixup = "pushd ~/nixcfg; nix flake update; popd";
      nixsw = "darwin-rebuild switch --flake ~/nixcfg/.#";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nir-direnv.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  home.file.".config/starship.toml".source = ./dotfiles/starship.toml;

  # Neovim
  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };
  home.file.".config/nvim" = {
    source = ./dotfiles/nvim;
    recursive = true;
  };

  # Config files
  home.file.".config/wezterm/wezterm.lua".source = ./dotfiles/wezterm.lua;
  home.file.".tmux.conf".source = ./dotfiles/tmux.conf;
}
