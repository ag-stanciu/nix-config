{ pkgs, ... }: {
  services.nix-daemon.enable = true;
  system.stateVersion = 4;
  system.defaults = {
    NSGlobalDomain.AppleShowAllExtension = true;
    NSGlobalDomain.InitialKeyRepeat = 14;
    NSGlobalDomain.KeyRepeat = 1;
  };

  fonts.fontDir.enable = true;
  fonts.fonts = [ (pkgs.nerdfonts.override { fonts = [ "Hasklig" ]; }) ];
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  environment = {
    shells = with pkgs; [ zsh ];
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
