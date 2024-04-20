{ pkgs, ... }: {
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
  system.defaults = {
    screencapture.type = "jpg";
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    dock = {
      autohide = true;
      mineffect = "scale";
      minimize-to-application = true;
      mru-spaces = false;
      orientation = "left";
      show-recents = false;
      tilesize = 48;
    };
    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
    };
  };
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      source-code-pro
      (nerdfonts.override { fonts = [ "Hasklig" "NerdFontsSymbolsOnly" ]; })
    ];
  };

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
    onActivation = {
      upgrade = true;
      cleanup = "zap";
    };
    caskArgs.no_quarantine = true;
    global.brewfile = true;
    masApps = { };
    casks = [
      "appcleaner"
      "arc"
      "bitwarden"
      "dbeaver-community"
      "google-chrome"
      "insomnia"
      "insomnium"
      "insomnium"
      "kitty"
      "maccy"
      "rectangle"
      "spotify"
      "the-unarchiver"
      "zed"
    ];
  };
}
