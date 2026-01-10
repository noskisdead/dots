{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      #####################
      ### Apps
      #####################
      "$terminal" = "foot";
      "$browser" = "zen";
      "$editor" = "nvim";
      "$fileExplorer" = "thunar";

      #####################
      ### Misc
      #####################
      "$volumeStep" = "10";

      #####################
      ### Modifier
      #####################
      "$mod" = "SUPER";

      #####################
      ### Keybind variables
      #####################
      "$kbMoveWinToWs" = "SUPER SHIFT";
      "$kbMoveWinToWsGroup" = "CTRL SUPER ALT";
      "$kbGoToWs" = "SUPER";
      "$kbGoToWsGroup" = "CTRL SUPER";

      "$kbNextWs" = "CTRL SUPER, right";
      "$kbPrevWs" = "CTRL SUPER, left";

      "$kbToggleSpecialWs" = "SUPER, S";

      "$kbWindowGroupCycleNext" = "ALT, Tab";
      "$kbWindowGroupCyclePrev" = "SHIFT ALT, Tab";
      "$kbUngroup" = "SUPER, U";
      "$kbToggleGroup" = "SUPER, Comma";

      "$kbMoveWindow" = "SUPER, Z";
      "$kbResizeWindow" = "SUPER, X";
      "$kbWindowPip" = "SUPER ALT, Backslash";
      "$kbPinWindow" = "SUPER, P";
      "$kbWindowFullscreen" = "SUPER, F";
      "$kbWindowBorderedFullscreen" = "SUPER ALT, F";
      "$kbToggleWindowFloating" = "SUPER ALT, Space";
      "$kbCloseWindow" = "SUPER, Q";

      "$kbSystemMonitor" = "CTRL SHIFT, Escape";
      "$kbMusic" = "SUPER, M";
      "$kbCommunication" = "SUPER, D";
      "$kbTodo" = "SUPER, R";

      "$kbTerminal" = "SUPER, T";
      "$kbBrowser" = "SUPER, B";
      "$kbEditor" = "SUPER, C";
      "$kbFileExplorer" = "SUPER, E";

      "$kbSession" = "CTRL ALT, Delete";
      "$kbClearNotifs" = "CTRL ALT, C";
      "$kbShowPanels" = "SUPER, K";
      "$kbLock" = "SUPER, L";
      "$kbRestoreLock" = "SUPER ALT, L";

      # $wsaction variable definition
      "$wsaction" = "~/.nix/scripts/wsaction.sh";

      #####################
      ### Binds (General Keybinds)
      ### Consolidating all `bind` definitions into a single list
      #####################
      bind = [
	# App binds
        "$mod, Return, exec, $terminal"
        "$kbTerminal, exec, $terminal"
        "$kbBrowser, exec, $browser"
        "$kbEditor, exec, $editor"
        "$kbFileExplorer, exec, $fileExplorer"

        # Misc
        "$kbCloseWindow, killactive"
	"$mod, Space, global, caelestia:launcher"
        "$kbSession, global, caelestia:session"
        "$kbShowPanels, global, caelestia:showall"
        "$kbLock, global, caelestia:lock"

        # Go to workspace #
        "$kbGoToWs, 1, exec, $wsaction workspace 1"
        "$kbGoToWs, 2, exec, $wsaction workspace 2"
        "$kbGoToWs, 3, exec, $wsaction workspace 3"
        "$kbGoToWs, 4, exec, $wsaction workspace 4"
        "$kbGoToWs, 5, exec, $wsaction workspace 5"
        "$kbGoToWs, 6, exec, $wsaction workspace 6"
        "$kbGoToWs, 7, exec, $wsaction workspace 7"
        "$kbGoToWs, 8, exec, $wsaction workspace 8"
        "$kbGoToWs, 9, exec, $wsaction workspace 9"
        "$kbGoToWs, 0, exec, $wsaction workspace 10"
        # Go to workspace group #
        "$kbGoToWsGroup, 1, exec, $wsaction -g workspace 1"
        "$kbGoToWsGroup, 2, exec, $wsaction -g workspace 2"
        "$kbGoToWsGroup, 3, exec, $wsaction -g workspace 3"
        "$kbGoToWsGroup, 4, exec, $wsaction -g workspace 4"
        "$kbGoToWsGroup, 5, exec, $wsaction -g workspace 5"
        "$kbGoToWsGroup, 6, exec, $wsaction -g workspace 6"
        "$kbGoToWsGroup, 7, exec, $wsaction -g workspace 7"
        "$kbGoToWsGroup, 8, exec, $wsaction -g workspace 8"
        "$kbGoToWsGroup, 9, exec, $wsaction -g workspace 9"
        "$kbGoToWsGroup, 0, exec, $wsaction -g workspace 10"
        # Go to workspace -1/+1 (mouse binds)
        "Super, mouse_down, workspace, -1"
        "Super, mouse_up, workspace, +1"
        # Go to workspace group -1/+1 (mouse binds)
        "Ctrl+Super, mouse_down, workspace, -10"
        "Ctrl+Super, mouse_up, workspace, +10"
        # Toggle special workspace
        "$kbToggleSpecialWs, exec, caelestia toggle specialws"

        # Move window to workspace #
        "$kbMoveWinToWs, 1, exec, $wsaction movetoworkspace 1"
        "$kbMoveWinToWs, 2, exec, $wsaction movetoworkspace 2"
        "$kbMoveWinToWs, 3, exec, $wsaction movetoworkspace 3"
        "$kbMoveWinToWs, 4, exec, $wsaction movetoworkspace 4"
        "$kbMoveWinToWs, 5, exec, $wsaction movetoworkspace 5"
        "$kbMoveWinToWs, 6, exec, $wsaction movetoworkspace 6"
        "$kbMoveWinToWs, 7, exec, $wsaction movetoworkspace 7"
        "$kbMoveWinToWs, 8, exec, $wsaction movetoworkspace 8"
        "$kbMoveWinToWs, 9, exec, $wsaction movetoworkspace 9"
        "$kbMoveWinToWs, 0, exec, $wsaction movetoworkspace 10"

        # Move window to workspace group #
        "$kbMoveWinToWsGroup, 1, exec, $wsaction -g movetoworkspace 1"
        "$kbMoveWinToWsGroup, 2, exec, $wsaction -g movetoworkspace 2"
        "$kbMoveWinToWsGroup, 3, exec, $wsaction -g movetoworkspace 3"
        "$kbMoveWinToWsGroup, 4, exec, $wsaction -g movetoworkspace 4"
        "$kbMoveWinToWsGroup, 5, exec, $wsaction -g movetoworkspace 5"
        "$kbMoveWinToWsGroup, 6, exec, $wsaction -g movetoworkspace 6"
        "$kbMoveWinToWsGroup, 7, exec, $wsaction -g movetoworkspace 7"
        "$kbMoveWinToWsGroup, 8, exec, $wsaction -g movetoworkspace 8"
        "$kbMoveWinToWsGroup, 9, exec, $wsaction -g movetoworkspace 9"
        "$kbMoveWinToWsGroup, 0, exec, $wsaction -g movetoworkspace 10"

        # Move window to workspace -1/+1 (mouse binds)
        "Super+Alt, mouse_down, movetoworkspace, -1"
        "Super+Alt, mouse_up, movetoworkspace, +1"

        # Move window to/from special workspace
        "Ctrl+Super+Shift, up, movetoworkspace, special:special"
        "Ctrl+Super+Shift, down, movetoworkspace, e+0"
        "Super+Alt, S, movetoworkspace, special:special"

        # Window groups
        "$kbToggleGroup, togglegroup"
        "$kbUngroup, moveoutofgroup"

        # Lock active group (No longer using 'bindl' for this as it's not a lock screen bind)
        "Super+Shift, Comma, lockactivegroup, toggle"

        # Window actions
        "Super, left, movefocus, l"
        "Super, right, movefocus, r"
        "Super, up, movefocus, u"
        "Super, down, movefocus, d"
        "Super+Shift, left, movewindow, l"
        "Super+Shift, right, movewindow, r"
        "Super+Shift, up, movewindow, u"
        "Super+Shift, down, movewindow, d"
        "Ctrl+Super, Backslash, centerwindow, 1"
        "Ctrl+Super+Alt, Backslash, resizeactive, exact 55% 70%"
        "Ctrl+Super+Alt, Backslash, centerwindow, 1"
        "$kbWindowPip, exec, caelestia resizer pip"
        "$kbPinWindow, pin"
        "$kbWindowFullscreen, fullscreen, 0"
        "$kbWindowBorderedFullscreen, fullscreen, 1"
        "$kbToggleWindowFloating, togglefloating,"
        "$kbCloseWindow, killactive,"

        # Special workspace toggles
        "$kbSystemMonitor, exec, caelestia toggle sysmon"
        "$kbMusic, exec, caelestia toggle music"
        "$kbCommunication, exec, caelestia toggle communication"
        "$kbTodo, exec, caelestia toggle todo"

        # Apps
        "$kbTerminal, exec, app2unit -- $terminal"
        "$kbBrowser, exec, app2unit -- $browser"
        "$kbEditor, exec, app2unit -- $editor"
        "Super, G, exec, app2unit -- github-desktop"
        "$kbFileExplorer, exec, app2unit -- $fileExplorer"
        "Super+Alt, E, exec, app2unit -- nemo"
        "Ctrl+Alt, Escape, exec, app2unit -- qps"
        "Ctrl+Alt, V, exec, app2unit -- pavucontrol"

        # Utilities
        ", Print, exec, caelestia screenshot"
        "Super+Shift, S, global, caelestia:screenshotFreeze"
        "Super+Shift+Alt, S, global, caelestia:screenshot"
        "Super+Alt, R, exec, caelestia record -s"
        "Ctrl+Alt, R, exec, caelestia record"
        "Super+Shift+Alt, R, exec, caelestia record -r"
        "Super+Shift, C, exec, hyprpicker -a"

        # Sleep
        "Super+Shift, L, exec, systemctl suspend-then-hibernate"

        # Clipboard and emoji picker
        "Super, V, exec, pkill fuzzel || caelestia clipboard"
        "Super+Alt, V, exec, pkill fuzzel || caelestia clipboard -d"
        "Super, Period, exec, pkill fuzzel || caelestia emoji -p"
        "Ctrl+Shift+Alt, V, exec, sleep 0.5s && ydotool type -d 1 \"$(cliphist list | head -1 | cliphist decode)\""
      ];

      #####################
      ### Some Mouse Binds
      #####################
      bindm = [
        "Super, mouse:272, movewindow"
        "$kbMoveWindow, movewindow"
        "Super, mouse:273, resizewindow"
        "$kbResizeWindow, resizewindow"
      ];

      #####################
      ### Lock-Screen Binds
      ### Keybinds that persist during a lock screen
      #####################
      bindl = [
        "$kbClearNotifs, global, caelestia:clearNotifs"
        # Restore lock
        "$kbRestoreLock, exec, caelestia shell -d"
        "$kbRestoreLock, global, caelestia:lock"

        # Brightness
        ", XF86MonBrightnessUp, global, caelestia:brightnessUp"
        ", XF86MonBrightnessDown, global, caelestia:brightnessDown"

        # Media
        "Ctrl+Super, Space, global, caelestia:mediaToggle"
        ", XF86AudioPlay, global, caelestia:mediaToggle"
        ", XF86AudioPause, global, caelestia:mediaToggle"
        "Ctrl+Super, Equal, global, caelestia:mediaNext"
        ", XF86AudioNext, global, caelestia:mediaNext"
        "Ctrl+Super, Minus, global, caelestia:mediaPrev"
        ", XF86AudioPrev, global, caelestia:mediaPrev"
        ", XF86AudioStop, global, caelestia:mediaStop"

        # Volume
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "Super+Shift, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $volumeStep%+"
        ", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ $volumeStep%-"
      ];

      #####################
      ### Continuous Binds (Bind Repeating)
      ### Keybinds that execute repeatedly while held
      #####################
      binde = [
        # Go to workspace -1/+1
        "$kbPrevWs, workspace, -1"
        "$kbNextWs, workspace, +1"
        "Super, Page_Up, workspace, -1"
        "Super, Page_Down, workspace, +1"
        # Move window to workspace -1/+1
        "Super+Alt, Page_Up, movetoworkspace, -1"
        "Super+Alt, Page_Down, movetoworkspace, +1"
        "Ctrl+Super+Shift, right, movetoworkspace, +1"
        "Ctrl+Super+Shift, left, movetoworkspace, -1"
        # Window actions
        "Super, Minus, splitratio, -0.1"
        "Super, Equal, splitratio, 0.1"
        # Window groups
        "$kbWindowGroupCycleNext, cyclenext"
        "$kbWindowGroupCyclePrev, cyclenext, prev"
        "Ctrl+Alt, Tab, changegroupactive, f"
        "Ctrl+Shift+Alt, Tab, changegroupactive, b"
      ];

      #####################
      ### Restart/Kill Binds (Bind Release)
      ### Keybinds that are executed when the key is released (for safety)
      #####################
      bindr = [
        # Kill/restart
        "Ctrl+Super+Shift, R, exec, qs -c caelestia kill"
        "Ctrl+Super+Alt, R, exec, qs -c caelestia kill; caelestia shell -d"
      ];

      # Default monitor conf
      monitor = ", preferred, auto, 1";

      animations = {
        enabled = true;

        # Animation curves (FIXED: Converted multiple definitions into a list)
        bezier = [
          "specialWorkSwitch, 0.05, 0.7, 0.1, 1"
          "emphasizedAccel, 0.3, 0, 0.8, 0.15"
          "emphasizedDecel, 0.05, 0.7, 0.1, 1"
          "standard, 0.2, 0, 0, 1"
        ];

        # Animation configs (FIXED: Converted multiple definitions into a list)
        animation = [
          "layersIn, 1, 5, emphasizedDecel, slide"
          "layersOut, 1, 4, emphasizedAccel, slide"
          "fadeLayers, 1, 5, standard"

          "windowsIn, 1, 5, emphasizedDecel"
          "windowsOut, 1, 3, emphasizedAccel"
          "windowsMove, 1, 6, standard"
          "workspaces, 1, 5, standard"

          "specialWorkspace, 1, 4, specialWorkSwitch, slidefadevert 15%"

          "fade, 1, 6, standard"
          "fadeDim, 1, 6, standard"
          "border, 1, 6, standard"
        ];
      };

      decoration = {
        rounding = "10";

        blur = {
          enabled = "true";
          xray = "false";
          special = "false";
          ignore_opacity = true; # Allows opacity blurring
          new_optimizations = true;
          popups = "true";
          input_methods = "true";
          size = "8";
          passes = "2";
        };

        shadow = {
          enabled = "true";
          range = "20";
          render_power = "3";
          color = "rgba(131317d4)";
        };
      };

      # Exec-once directives (FIXED: Converted multiple definitions into a single list)
      "exec-once" = [
        # Auto delete trash 30 days old
        "trash-empty 30"

        # Resize and move windows based on matches (e.g. pip)
        "caelestia resizer -d"

        # Start shell
        "caelestia shell -d"
      ];

      general = {
        layout = "dwindle";
        allow_tearing = false; # Allows `immediate` window rule to work
        gaps_workspaces = "20";
        gaps_in = "10";
        gaps_out = "40";
        border_size = "3";

        "col.active_border" = "rgba(c2c1ffe6)";
        "col.inactive_border" = "rgba(c2c1ffe6)";
      };

      dwindle = {
        preserve_split = true;
        smart_split = false;
        smart_resizing = true;
      };

      group = {
        "col.border_active" = "rgba(c2c1ffe6)";
        "col.border_inactive" = "rgba(c8c5d111)";
        "col.border_locked_active" = "rgba(c2c1ffe6)";
        "col.border_locked_inactive" = "rgba(c8c5d111)";

        groupbar = {
          font_family = "JetBrains Mono NF";
          font_size = 15;
          gradients = true;
          gradient_round_only_edges = false;
          gradient_rounding = 5;
          height = 25;
          indicator_height = 0;
          gaps_in = 3;
          gaps_out = 3;

          text_color = "rgb(2a2a60)";
          "col.active" = "rgba(c2c1ffd4)";
          "col.inactive" = "rgba(918f9ad4)";
          "col.locked_active" = "rgba(c2c1ffd4)";
          "col.locked_inactive" = "rgba(c6c4e0d4)";
        };
      };

      input = {
        kb_layout = "us";
        numlock_by_default = false;
        repeat_delay = 250;
        repeat_rate = 35;

        focus_on_close = 1;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = "false";
          scroll_factor = "0.3";
        };
      };

      binds = {
        scroll_event_delay = 0;
      };

      cursor = {
        hotspot_padding = 1;
      };


      misc = {
        vfr = true;
        vrr = 1;
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
        on_focus_under_fullscreen = 2;
        allow_session_lock_restore = true;
        middle_click_paste = false;
        focus_on_activate = true;
        session_lock_xray = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        background_color = "rgb(201f23)";
      };

      debug = {
        error_position = 1;
      };

      # ######## Window rules ######## (FIXED: Converted multiple definitions into a list)
      windowrule = [
        "opacity 0.95 override, match:fullscreen false"

        "opaque true, match:class foot|equibop|org\\.quickshell|imv|swappy" # They use native transparency or we want them opaque
        "center true, match:float true, match:xwayland false" # Center all floating windows (not xwayland cause popups)

        # Float
        "float true, match:class guifetch" # FlafyDev/guifetch
        "float true, match:class yad"
        "float true, match:class zenity"
        "float true, match:class wev"
        "float true, match:class org\\.gnome\\.FileRoller"
        "float true, match:class file-roller" # WHY IS THERE TWOOOOOOOOOOOOOOOO
        "float true, match:class blueman-manager"
        "float true, match:class com\\.github\\.GradienceTeam\\.Gradience"
        "float true, match:class feh"
        "float true, match:class imv"
        "float true, match:class system-config-printer"
        "float true, match:class org\\.quickshell"

        # Float, resize and center
        "float true, match:class foot, match:title nmtui"
        "size 60% 70%, match:class foot, match:title nmtui"
        "center 1, match:class foot, match:title nmtui"
        "float true, match:class org\\.gnome\\.Settings"
        "size 70% 80%, match:class org\\.gnome\\.Settings"
        "center 1, match:class org\\.gnome\\.Settings"
        "float true, match:class org\\.pulseaudio\\.pavucontrol|yad-icon-browser"
        "size 60% 70%, match:class org\\.pulseaudio\\.pavucontrol|yad-icon-browser"
        "center 1, match:class org\\.pulseaudio\\.pavucontrol|yad-icon-browser"
        "float true, match:class nwg-look"
        "size 50% 60%, match:class nwg-look"
        "center 1, match:class nwg-look"

        # Special workspaces
        "workspace special:sysmon, match:class btop"
        "workspace special:music, match:class feishin|Spotify|Supersonic|Cider"
        "workspace special:music, match:initial_title Spotify( Free)?" # Spotify wayland, it has no class for some reason
        "workspace special:communication, match:class discord|equibop|vesktop|whatsapp"
        "workspace special:todo, match:class Todoist"

        # Dialogs
        "float true, match:title (Select|Open)( a)? (File|Folder)(s)?"
        "float true, match:title File (Operation|Upload)( Progress)?"
        "float true, match:title .* Properties"
        "float true, match:title Export Image as PNG"
        "float true, match:title GIMP Crash Debug"
        "float true, match:title Save As"
        "float true, match:title Library"

        # Picture in picture (resize and move done via script)
        "move 100%-w-2% 100%-w-3%, match:title Picture(-| )in(-| )[Pp]icture" # Initial move so window doesn't shoot across the screen from the center
        "keep_aspect_ratio true, match:title Picture(-| )in(-| )[Pp]icture"
        "float true, match:title Picture(-| )in(-| )[Pp]icture"
        "pin true, match:title Picture(-| )in(-| )[Pp]icture"

        # Steam
        "rounding 10, match:class steam"
        "float true, match:title Friends List, match:class steam"
        "immediate true, match:class steam_app_[0-9]+" # Allow tearing for steam games
        "idle_inhibit always, match:class steam_app_[0-9]+" # Always idle inhibit when playing a steam game

        # ATLauncher console
        "float true, match:class com-atlauncher-App, match:title ATLauncher Console"

        # Autodesk Fusion 360
        "no_blur true, match:title Fusion360|(Marking Menu), match:class fusion360\\.exe"

        # Ugh xwayland popups
        "no_dim true, match:xwayland 1, match:title win[0-9]+"
        "no_shadow true, match:xwayland 1, match:title win[0-9]+"
        "rounding 10, match:xwayland 1, match:title win[0-9]+"
      ];

      # ######## Workspace rules ######## (FIXED: Converted multiple definitions into a list)
      workspace = [
        "w[tv1]s[false], gapsout:20"
        "f[1]s[false], gapsout:20"
      ];

      # ######## Layer rules ######## (FIXED: Converted multiple definitions into a list)
      layerrule = [
        "animation fade, match:namespace hyprpicker" # Colour picker out animation
        "animation fade, match:namespace logout_dialog" # wlogout
        "animation fade, match:namespace selection" # slurp
        "animation fade, match:namespace wayfreeze"

        # Fuzzel
        "animation popin 80%, match:namespace launcher"
        "blur true, match:namespace launcher"

        # Shell
        "no_anim true, match:namespace caelestia-(border-exclusion|area-picker)"
        "animation fade, match:namespace caelestia-(drawers|background)"

        "blur true, match:namespace caelestia-drawers"
        "ignore_alpha 0.57, match:namespace caelestia-drawers"
      ];
    };
  };
}
