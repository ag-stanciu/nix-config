{ pkgs, ... }: {
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
  system.defaults = {
    screencapture.type = "jpg";
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
    NSGlobalDomain.ApplePressAndHoldEnabled = false;
    NSGlobalDomain.AppleFontSmoothing = 1;
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
    # universalaccess.reduceMotion = true;
  };
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.activationScripts.postUserActivation.text = ''
    # Following line should allow us to avoid a logout/login cycle
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      source-code-pro
      (nerdfonts.override { fonts = [ "Hasklig" "NerdFontsSymbolsOnly" ]; })
    ];
  };

  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
    settings = {
      auto-optimise-store = true;
      experimental-features = ["flakes" "nix-command"];
      builders-use-substitutes = true;
      substituters = ["https://nix-community.cachix.org"];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      warn-dirty = false;
    };
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
    taps = [
      "homebrew/cask-versions"
    ];
    casks = [
      "appcleaner"
      "arc"
      "bitwarden"
      "dbeaver-community"
      "docker"
      "google-chrome"
      "google-drive"
      "insomnium"
      "kitty"
      "logi-options-plus"
      "maccy"
      "rectangle"
      "slack"
      "spotify"
      "the-unarchiver"
      "zed-preview"
      "zoom"
    ];
  };
}
