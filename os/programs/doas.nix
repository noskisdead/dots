{
  # Disable sudo entirely
  security.sudo.enable = false;

  # Enable doas
  security.doas = {
    enable = true;

    # Allow members of wheel to act as root
    extraRules = [
      {
        groups = ["wheel"];
        persist = true; # like sudo's timestamp
        keepEnv = true; # optional, similar to sudo -E
      }
    ];
  };

  environment.shellAliases = {
    sudo = "doas";
  };
}
