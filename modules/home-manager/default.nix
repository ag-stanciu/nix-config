{ pkgs, ... }: {
  home.stateVersion = "22.11";
  home.sessionVariable = {
    CLICOLOR = 1;
    EDITOR = "nvim";
    LC_CTYPE = "en_US.UTF-8";
  };
  home.packages = with pkgs; [
    fd
    curl
    git
    ripgrep
    git
    go
    hyperfine
    jq
  ];

  programs.zsh.enable = true;
  programs.enableCompletion = true;
  programs.zsh.shellAliases = {
    ls = "ls --color=auto";
    nixup = "pushd ~/nixcfg; nix flake update; popd";
    nixsw = "darwin-rebuild switch --flake ~/nixcfg/.#";
  };

  programs.fzf.enable = true;
  programs.fzf.enableZshIntegration = true;

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  home.file.".config/starship.toml".source = ./dotfiles/starship.toml;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
  };

  home.file.".config/wezterm/wezterm".source = ./dotfiles/wezterm.lua;
}
