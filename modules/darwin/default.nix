{ pkgs, ... }: {
  services.nix-daemon.enable = true;

  system.stateVersion = 4;
  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
    dock = {
      autohide = true;
      orientation = "left";
      show-recents = false;
      tilesize = 48;
      minimize-to-application = true;
      mineffect = "scale";
    };
    finder = {
      ShowPathbar = true;
      ShowStatusBar = true;
    };
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
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
      "maccy"
      "arc"
      "appcleaner"
      "rectangle"
      "spotify"
      "the-unarchiver"
      "kitty"
      "insomnia"
    ];
  };
}
