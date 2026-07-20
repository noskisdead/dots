{
  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = ["*"]; # Apply to all keyboards
      settings = {
        main = {
          capslock = "\\";
          numlock = "noop";
        };
      };
    };
  };
}
