{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  system.stateVersion = 4;
  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };

  fonts.fontDir.enable = true;
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; }) ];
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      warn-dirty = false
    '';
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = { auto-optimise-store = true; };
  };
  environment = {
    shells = with pkgs;
      [ zsh ];
    loginShell = pkgs.zsh;
    systemPackages = [ pkgs.coreutils ];
    systemPath = [ "/opt/homebrew/bin" ];
  };

  programs.zsh.enable = true;

  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    casks = [
      "maccy"
      "firefox"
      "appcleaner"
      "rectangle"
      "spotify"
      "the-unarchiver"
      "wezterm"
    ];
  };
}
