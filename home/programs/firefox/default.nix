{
  pkgs,
  lib,
  ...
}: {
  programs.librewolf.enable = true;

  programs.firefox = {
    enable = true;
    profiles = let
      defaultSettings = {
        "app.update.auto" = false;
        "browser.startup.homepage" = "https://lobste.rs";
        # *snip* no need to splurge all my settings, you get the idea...
        # "identity.fxaccounts.account.device.name" = config.networking.hostName;
        # "signon.rememberSignons" = false;
      };
    in {
      home = {
        id = 0;
        settings =
          defaultSettings
          // {
            "browser.urlbar.placeholderName" = "DuckDuckGo";
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          };
        # userChrome = builtins.readFile ../conf.d/userChrome.css;
      };
    };
  };
}
