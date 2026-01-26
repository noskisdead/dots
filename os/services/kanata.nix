{
  services.kanata = {
    enable = true;
    keyboards.default = {
      devices = ["/dev/input/by-path/platform-i8042-serio-0-event-kbd"];
      config = ''
        (defsrc
          caps
        )

        (deflayer base
          escctrl
        )

        (defalias escctrl
          (tap-hold 200 200 esc lctl)
        )
      '';
    };
  };
}
