{lib, ...}: let
  # Helper to write raw Lua inline for hl.* function arguments
  lua = lib.generators.mkLuaInline;

  # Standard Binds
  mkBind = key: action: {_args = [key (lua action)];};
  mkBindLuaKey = keyExpr: action: {_args = [(lua keyExpr) (lua action)];};

  # Mouse binds
  mkMouseBind = key: action: {_args = [key (lua action) {mouse = true;}];};
  mkMouseBindLuaKey = keyExpr: action: {_args = [(lua keyExpr) (lua action) {mouse = true;}];};

  # Locked binds
  mkLockedBind = key: action: {_args = [key (lua action) {locked = true;}];};
  mkLockedBindLuaKey = keyExpr: action: {_args = [(lua keyExpr) (lua action) {locked = true;}];};

  # Repeating binds
  mkRepeatBind = key: action: {_args = [key (lua action) {repeating = true;}];};
  mkRepeatBindLuaKey = keyExpr: action: {_args = [(lua keyExpr) (lua action) {repeating = true;}];};

  # Release binds
  mkReleaseBind = key: action: {_args = [key (lua action) {release = true;}];};
  mkReleaseBindLuaKey = keyExpr: action: {_args = [(lua keyExpr) (lua action) {release = true;}];};
in {
  wayland.windowManager.hyprland = {
    configType = "lua";
    enable = true;

    settings = {
      #####################
      ### Apps (Lua Locals)
      #####################
      terminal = {_var = "foot";};
      browser = {_var = "zen-beta";};
      editor = {_var = "nvim";};
      fileExplorer = {_var = "thunar";};

      #####################
      ### Misc
      #####################
      volumeStep = {_var = "10";};
      wsaction = {_var = "~/.nix/misc/scripts/wsaction.sh";};

      #####################
      ### Keybind variables
      #####################
      mod = {_var = "SUPER";};
      kbMoveWinToWs = {_var = "SUPER + SHIFT";};
      kbMoveWinToWsGroup = {_var = "CTRL + SUPER + ALT";};
      kbGoToWs = {_var = "SUPER";};
      kbGoToWsGroup = {_var = "CTRL + SUPER";};

      kbNextWs = {_var = "CTRL + SUPER + right";};
      kbPrevWs = {_var = "CTRL + SUPER + left";};

      kbToggleSpecialWs = {_var = "SUPER + S";};

      kbWindowGroupCycleNext = {_var = "ALT + Tab";};
      kbWindowGroupCyclePrev = {_var = "SHIFT + ALT + Tab";};
      kbUngroup = {_var = "SUPER + U";};
      kbToggleGroup = {_var = "SUPER + Comma";};

      kbMoveWindow = {_var = "SUPER + Z";};
      kbResizeWindow = {_var = "SUPER + X";};
      kbWindowPip = {_var = "SUPER + ALT + Backslash";};
      kbPinWindow = {_var = "SUPER + P";};
      kbWindowFullscreen = {_var = "SUPER + F";};
      kbWindowBorderedFullscreen = {_var = "SUPER + ALT + F";};
      kbToggleWindowFloating = {_var = "SUPER + ALT + Space";};
      kbCloseWindow = {_var = "SUPER + Q";};

      kbSystemMonitor = {_var = "CTRL + SHIFT + Escape";};
      kbMusic = {_var = "SUPER + M";};
      kbCommunication = {_var = "SUPER + D";};
      kbTodo = {_var = "SUPER + R";};

      kbTerminal = {_var = "SUPER + Return";};
      kbBrowser = {_var = "SUPER + B";};
      kbEditor = {_var = "SUPER + C";};
      kbFileExplorer = {_var = "SUPER + E";};

      kbSession = {_var = "CTRL + ALT + Delete";};
      kbClearNotifs = {_var = "CTRL + ALT + C";};
      kbShowPanels = {_var = "SUPER + K";};
      kbLock = {_var = "SUPER + L";};
      kbRestoreLock = {_var = "SUPER + ALT + L";};

      #####################
      ### Core Settings (hl.config structure with proper integer types)
      #####################
      config = {
        animations = {
          enabled = true;
          bezier = [
            "specialWorkSwitch, 0.05, 0.7, 0.1, 1"
            "emphasizedAccel, 0.3, 0, 0.8, 0.15"
            "emphasizedDecel, 0.05, 0.7, 0.1, 1"
            "standard, 0.2, 0, 0, 1"
          ];
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
          rounding = 10;
          blur = {
            enabled = true;
            xray = false;
            special = false;
            ignore_opacity = true;
            new_optimizations = true;
            popups = true;
            input_methods = true;
            size = 8;
            passes = 2;
          };
          shadow = {
            enabled = true;
            range = 20;
            render_power = 3;
            color = "rgba(131317d4)";
          };
        };

        ecosystem = {no_update_news = true;};

        general = {
          layout = "dwindle";
          allow_tearing = false;
          gaps_workspaces = 20;
          gaps_in = 10;
          gaps_out = 40;
          border_size = 3;
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
          kb_layout = "us,ca";
          kb_options = "caps:swapescape,grp:alt_space_toggle";
          numlock_by_default = false;
          repeat_delay = 250;
          repeat_rate = 35;
          focus_on_close = 1;
          touchpad = {
            natural_scroll = true;
            disable_while_typing = false;
            scroll_factor = 0.3;
          };
        };

        binds = {
          scroll_event_delay = 0;
        };

        cursor = {
          inactive_timeout = 5;
          hotspot_padding = 1;
        };

        misc = {
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

        on = {
          _args = [
            "hyprland.start"
            (lib.generators.mkLuaInline ''
              function()
                hl.exec_cmd("trash-empty 30")
                hl.exec_cmd("caelestia resizer -d")
                hl.exec_cmd("app2unit -- equibop -m")
              end
            '')
          ];
        };

        debug = {
          error_position = 1;
        };
      };

      #####################
      ### Root Level Settings & Rules
      #####################

      # Monitor
      monitor = [
        {
          output = "";
          mode = "preferred";
          position = "auto";
          scale = 1;
        }
      ];

      # Window Rules
      window_rule = [
        {
          match = {fullscreen = false;};
          opacity = "0.95 override";
        }
        {
          match = {class = "foot|equibop|org\\.quickshell|imv|swappy";};
          opaque = true;
        }
        {
          match = {
            float = true;
            xwayland = false;
          };
          center = true;
        }
        {
          match = {class = "guifetch";};
          float = true;
        }
        {
          match = {class = "yad";};
          float = true;
        }
        {
          match = {class = "zenity";};
          float = true;
        }
        {
          match = {class = "wev";};
          float = true;
        }
        {
          match = {class = "org\\.gnome\\.FileRoller";};
          float = true;
        }
        {
          match = {class = "file-roller";};
          float = true;
        }
        {
          match = {class = "blueman-manager";};
          float = true;
        }
        {
          match = {class = "com\\.github\\.GradienceTeam\\.Gradience";};
          float = true;
        }
        {
          match = {class = "feh";};
          float = true;
        }
        {
          match = {class = "imv";};
          float = true;
        }
        {
          match = {class = "system-config-printer";};
          float = true;
        }
        {
          match = {class = "org\\.quickshell";};
          float = true;
        }
        {
          match = {
            class = "foot";
            title = "nmtui";
          };
          float = true;
        }
        {
          match = {
            class = "foot";
            title = "nmtui";
          };
          size = "60% 70%";
        }
        {
          match = {
            class = "foot";
            title = "nmtui";
          };
          center = 1;
        }
        {
          match = {class = "org\\.gnome\\.Settings";};
          float = true;
        }
        {
          match = {class = "org\\.gnome\\.Settings";};
          size = "70% 80%";
        }
        {
          match = {class = "org\\.gnome\\.Settings";};
          center = 1;
        }
        {
          match = {class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser";};
          float = true;
        }
        {
          match = {class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser";};
          size = "60% 70%";
        }
        {
          match = {class = "org\\.pulseaudio\\.pavucontrol|yad-icon-browser";};
          center = 1;
        }
        {
          match = {class = "nwg-look";};
          float = true;
        }
        {
          match = {class = "nwg-look";};
          size = "50% 60%";
        }
        {
          match = {class = "nwg-look";};
          center = 1;
        }
        {
          match = {class = "btop";};
          workspace = "special:sysmon";
        }
        {
          match = {class = "feishin|Spotify|Supersonic|Cider";};
          workspace = "special:music";
        }
        {
          match = {initial_title = "Spotify( Free)?";};
          workspace = "special:music";
        }
        {
          match = {class = "discord|equibop|vesktop|whatsapp";};
          workspace = "special:communication";
        }
        {
          match = {class = "Todoist";};
          workspace = "special:todo";
        }
        {
          match = {title = "(Select|Open)( a)? (File|Folder)(s)?";};
          float = true;
        }
        {
          match = {title = "File (Operation|Upload)( Progress)?";};
          float = true;
        }
        {
          match = {title = ".* Properties";};
          float = true;
        }
        {
          match = {title = "Export Image as PNG";};
          float = true;
        }
        {
          match = {title = "GIMP Crash Debug";};
          float = true;
        }
        {
          match = {title = "Save As";};
          float = true;
        }
        {
          match = {title = "Library";};
          float = true;
        }
        {
          match = {title = "Picture(-| )in(-| )[Pp]icture";};
          move = "100%-w-2% 100%-w-3%";
        }
        {
          match = {title = "Picture(-| )in(-| )[Pp]icture";};
          keep_aspect_ratio = true;
        }
        {
          match = {title = "Picture(-| )in(-| )[Pp]icture";};
          float = true;
        }
        {
          match = {title = "Picture(-| )in(-| )[Pp]icture";};
          pin = true;
        }
        {
          match = {class = "steam";};
          rounding = 10;
        }
        {
          match = {
            title = "Friends List";
            class = "steam";
          };
          float = true;
        }
        {
          match = {class = "steam_app_[0-9]+";};
          immediate = true;
        }
        {
          match = {class = "steam_app_[0-9]+";};
          idle_inhibit = "always";
        }
        {
          match = {
            class = "com-atlauncher-App";
            title = "ATLauncher Console";
          };
          float = true;
        }
        {
          match = {
            title = "Fusion360|(Marking Menu)";
            class = "fusion360\\.exe";
          };
          no_blur = true;
        }
        {
          match = {
            xwayland = 1;
            title = "win[0-9]+";
          };
          no_dim = true;
        }
        {
          match = {
            xwayland = 1;
            title = "win[0-9]+";
          };
          no_shadow = true;
        }
        {
          match = {
            xwayland = 1;
            title = "win[0-9]+";
          };
          rounding = 10;
        }
      ];
      # Workspace rules
      workspace_rule = [
        {
          workspace = "w[tv1]s[false]";
          gaps_out = 20;
        }
        {
          workspace = "f[1]s[false]";
          gaps_out = 20;
        }
      ];

      # Layer rules translated to Attribute Sets
      layer_rule = [
        {
          match = {namespace = "hyprpicker";};
          animation = "fade";
        }
        {
          match = {namespace = "logout_dialog";};
          animation = "fade";
        }
        {
          match = {namespace = "selection";};
          animation = "fade";
        }
        {
          match = {namespace = "wayfreeze";};
          animation = "fade";
        }
        {
          match = {namespace = "launcher";};
          animation = "popin 80%";
        }
        {
          match = {namespace = "launcher";};
          blur = true;
        }
        {
          match = {namespace = "caelestia-(border-exclusion|area-picker)";};
          no_anim = true;
        }
        {
          match = {namespace = "caelestia-(drawers|background)";};
          animation = "fade";
        }
        {
          match = {namespace = "caelestia-drawers";};
          blur = true;
        }
        {
          match = {namespace = "caelestia-drawers";};
          ignore_alpha = 0.57;
        }
      ];

      #####################
      ### ALL Binds Combined
      #####################

      bind = [
        # Misc
        (mkBindLuaKey "kbCloseWindow" "hl.dsp.window.close()")
        (mkBindLuaKey "mod .. ' + Space'" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:launcher')")
        (mkBindLuaKey "kbSession" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:session')")
        (mkBindLuaKey "kbShowPanels" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:showall')")
        (mkBindLuaKey "kbLock" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:lock')")

        # Go to workspace
        (mkBindLuaKey "kbGoToWs .. ' + 1'" "hl.dsp.exec_cmd(wsaction .. ' workspace 1')")
        (mkBindLuaKey "kbGoToWs .. ' + 2'" "hl.dsp.exec_cmd(wsaction .. ' workspace 2')")
        (mkBindLuaKey "kbGoToWs .. ' + 3'" "hl.dsp.exec_cmd(wsaction .. ' workspace 3')")
        (mkBindLuaKey "kbGoToWs .. ' + 4'" "hl.dsp.exec_cmd(wsaction .. ' workspace 4')")
        (mkBindLuaKey "kbGoToWs .. ' + 5'" "hl.dsp.exec_cmd(wsaction .. ' workspace 5')")
        (mkBindLuaKey "kbGoToWs .. ' + 6'" "hl.dsp.exec_cmd(wsaction .. ' workspace 6')")
        (mkBindLuaKey "kbGoToWs .. ' + 7'" "hl.dsp.exec_cmd(wsaction .. ' workspace 7')")
        (mkBindLuaKey "kbGoToWs .. ' + 8'" "hl.dsp.exec_cmd(wsaction .. ' workspace 8')")
        (mkBindLuaKey "kbGoToWs .. ' + 9'" "hl.dsp.exec_cmd(wsaction .. ' workspace 9')")
        (mkBindLuaKey "kbGoToWs .. ' + 0'" "hl.dsp.exec_cmd(wsaction .. ' workspace 10')")

        # Go to workspace group
        (mkBindLuaKey "kbGoToWsGroup .. ' + 1'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 1')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 2'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 2')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 3'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 3')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 4'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 4')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 5'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 5')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 6'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 6')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 7'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 7')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 8'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 8')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 9'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 9')")
        (mkBindLuaKey "kbGoToWsGroup .. ' + 0'" "hl.dsp.exec_cmd(wsaction .. ' -g workspace 10')")

        # Go to workspace -1/+1 (mouse binds equivalent)
        (mkBind "SUPER + mouse_down" "hl.dsp.focus({ workspace = '-1' })")
        (mkBind "SUPER + mouse_up" "hl.dsp.focus({ workspace = '+1' })")
        (mkBind "CTRL + SUPER + mouse_down" "hl.dsp.focus({ workspace = '-10' })")
        (mkBind "CTRL + SUPER + mouse_up" "hl.dsp.focus({ workspace = '+10' })")

        # Toggle special workspace
        (mkBindLuaKey "kbToggleSpecialWs" "hl.dsp.exec_cmd('caelestia toggle specialws')")

        # Move window to workspace
        (mkBindLuaKey "kbMoveWinToWs .. ' + 1'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 1')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 2'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 2')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 3'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 3')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 4'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 4')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 5'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 5')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 6'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 6')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 7'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 7')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 8'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 8')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 9'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 9')")
        (mkBindLuaKey "kbMoveWinToWs .. ' + 0'" "hl.dsp.exec_cmd(wsaction .. ' movetoworkspace 10')")

        # Move window to workspace group
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 1'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 1')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 2'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 2')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 3'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 3')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 4'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 4')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 5'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 5')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 6'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 6')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 7'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 7')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 8'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 8')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 9'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 9')")
        (mkBindLuaKey "kbMoveWinToWsGroup .. ' + 0'" "hl.dsp.exec_cmd(wsaction .. ' -g movetoworkspace 10')")

        # Move window to workspace -1/+1 (mouse binds)
        (mkBind "SUPER + ALT + mouse_down" "hl.dsp.window.move({ workspace = '-1' })")
        (mkBind "SUPER + ALT + mouse_up" "hl.dsp.window.move({ workspace = '+1' })")

        # Move window to/from special workspace
        (mkBind "CTRL + SUPER + SHIFT + up" "hl.dsp.window.move({ workspace = 'special:special' })")
        (mkBind "CTRL + SUPER + SHIFT + down" "hl.dsp.window.move({ workspace = 'e+0' })")
        (mkBind "SUPER + ALT + S" "hl.dsp.window.move({ workspace = 'special:special' })")

        # Window groups
        (mkBindLuaKey "kbToggleGroup" "hl.dsp.group.toggle()")
        (mkBindLuaKey "kbUngroup" "hl.dsp.exec_cmd('hyprctl dispatch moveoutofgroup')")

        # Lock active group
        (mkBind "SUPER + SHIFT + Comma" "hl.dsp.exec_cmd('hyprctl dispatch lockactivegroup toggle')")

        # Window actions
        (mkBind "SUPER + left" "hl.dsp.focus({ direction = 'l' })")
        (mkBind "SUPER + right" "hl.dsp.focus({ direction = 'r' })")
        (mkBind "SUPER + up" "hl.dsp.focus({ direction = 'u' })")
        (mkBind "SUPER + down" "hl.dsp.focus({ direction = 'd' })")
        (mkBind "SUPER + SHIFT + left" "hl.dsp.window.move({ direction = 'l' })")
        (mkBind "SUPER + SHIFT + right" "hl.dsp.window.move({ direction = 'r' })")
        (mkBind "SUPER + SHIFT + up" "hl.dsp.window.move({ direction = 'u' })")
        (mkBind "SUPER + SHIFT + down" "hl.dsp.window.move({ direction = 'd' })")
        (mkBind "CTRL + SUPER + Backslash" "hl.dsp.exec_cmd('hyprctl dispatch centerwindow 1')")
        (mkBind "CTRL + SUPER + ALT + Backslash" "hl.dsp.exec_cmd('hyprctl dispatch resizeactive exact 55% 70%')")
        (mkBindLuaKey "kbWindowPip" "hl.dsp.exec_cmd('caelestia resizer pip')")
        (mkBindLuaKey "kbPinWindow" "hl.dsp.exec_cmd('hyprctl dispatch pin')")
        (mkBindLuaKey "kbWindowFullscreen" "hl.dsp.window.fullscreen({ mode = 0 })")
        (mkBindLuaKey "kbWindowBorderedFullscreen" "hl.dsp.window.fullscreen({ mode = 1 })")
        (mkBindLuaKey "kbToggleWindowFloating" "hl.dsp.window.float({ action = 'toggle' })")
        (mkBindLuaKey "kbCloseWindow" "hl.dsp.window.close()")

        # Special workspace toggles
        (mkBindLuaKey "kbSystemMonitor" "hl.dsp.exec_cmd('caelestia toggle sysmon')")
        (mkBindLuaKey "kbMusic" "hl.dsp.exec_cmd('caelestia toggle music')")
        (mkBindLuaKey "kbCommunication" "hl.dsp.exec_cmd('caelestia toggle communication')")
        (mkBindLuaKey "kbTodo" "hl.dsp.exec_cmd('caelestia toggle todo')")

        # Apps
        (mkBindLuaKey "kbTerminal" "hl.dsp.exec_cmd('app2unit -- ' .. terminal)")
        (mkBindLuaKey "kbBrowser" "hl.dsp.exec_cmd('app2unit -- ' .. browser)")
        (mkBindLuaKey "kbEditor" "hl.dsp.exec_cmd('app2unit -- ' .. editor)")
        (mkBindLuaKey "kbFileExplorer" "hl.dsp.exec_cmd('app2unit -- ' .. fileExplorer)")
        (mkBind "CTRL + ALT + V" "hl.dsp.exec_cmd('app2unit -- pavucontrol')")

        # Utilities
        (mkBind "Print" "hl.dsp.exec_cmd('caelestia screenshot')")
        (mkBind "SUPER + SHIFT + S" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:screenshotFreeze')")
        (mkBind "SUPER + SHIFT + ALT + S" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:screenshot')")
        (mkBind "SUPER + ALT + R" "hl.dsp.exec_cmd('caelestia record -s')")
        (mkBind "CTRL + ALT + R" "hl.dsp.exec_cmd('caelestia record')")
        (mkBind "SUPER + SHIFT + ALT + R" "hl.dsp.exec_cmd('caelestia record -r')")
        (mkBind "SUPER + SHIFT + C" "hl.dsp.exec_cmd('hyprpicker -a')")

        # Clipboard and emoji picker
        (mkBind "SUPER + V" "hl.dsp.exec_cmd('pkill fuzzel || caelestia clipboard')")
        (mkBind "SUPER + ALT + V" "hl.dsp.exec_cmd('pkill fuzzel || caelestia clipboard -d')")
        (mkBind "SUPER + Period" "hl.dsp.exec_cmd('pkill fuzzel || caelestia emoji -p')")
        (mkBind "CTRL + SHIFT + ALT + V" "hl.dsp.exec_cmd('sleep 0.5s && ydotool type -d 1 \"$(cliphist list | head -1 | cliphist decode)\"')")

        # ================================
        # Mouse Binds (bindm)
        # ================================
        (mkMouseBind "SUPER + mouse:272" "hl.dsp.window.drag()")
        (mkMouseBindLuaKey "kbMoveWindow" "hl.dsp.window.drag()")
        (mkMouseBind "SUPER + mouse:273" "hl.dsp.window.resize()")
        (mkMouseBindLuaKey "kbResizeWindow" "hl.dsp.window.resize()")

        # ================================
        # Lock-Screen Binds (bindl)
        # ================================
        (mkLockedBindLuaKey "kbClearNotifs" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:clearNotifs')")
        (mkLockedBindLuaKey "kbRestoreLock" "hl.dsp.exec_cmd('caelestia shell -d')")
        # Brightness
        (mkLockedBind "XF86MonBrightnessUp" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:brightnessUp')")
        (mkLockedBind "XF86MonBrightnessDown" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:brightnessDown')")
        # Media
        (mkLockedBind "CTRL + SUPER + Space" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaToggle')")
        (mkLockedBind "XF86AudioPlay" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaToggle')")
        (mkLockedBind "XF86AudioPause" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaToggle')")
        (mkLockedBind "CTRL + SUPER + Equal" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaNext')")
        (mkLockedBind "XF86AudioNext" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaNext')")
        (mkLockedBind "CTRL + SUPER + Minus" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaPrev')")
        (mkLockedBind "XF86AudioPrev" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaPrev')")
        (mkLockedBind "XF86AudioStop" "hl.dsp.exec_cmd('hyprctl dispatch global caelestia:mediaStop')")
        # Volume
        (mkLockedBind "XF86AudioMicMute" "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle')")
        (mkLockedBind "XF86AudioMute" "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')")
        (mkLockedBind "SUPER + SHIFT + M" "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')")
        (mkLockedBind "XF86AudioRaiseVolume" "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ ' .. volumeStep .. '%+')")
        (mkLockedBind "XF86AudioLowerVolume" "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ ' .. volumeStep .. '%-')")

        # ================================
        # Continuous Binds (binde)
        # ================================
        (mkRepeatBindLuaKey "kbPrevWs" "hl.dsp.focus({ workspace = '-1' })")
        (mkRepeatBindLuaKey "kbNextWs" "hl.dsp.focus({ workspace = '+1' })")
        (mkRepeatBind "SUPER + Page_Up" "hl.dsp.focus({ workspace = '-1' })")
        (mkRepeatBind "SUPER + Page_Down" "hl.dsp.focus({ workspace = '+1' })")
        (mkRepeatBind "SUPER + ALT + Page_Up" "hl.dsp.window.move({ workspace = '-1' })")
        (mkRepeatBind "SUPER + ALT + Page_Down" "hl.dsp.window.move({ workspace = '+1' })")
        (mkRepeatBind "CTRL + SUPER + SHIFT + right" "hl.dsp.window.move({ workspace = '+1' })")
        (mkRepeatBind "CTRL + SUPER + SHIFT + left" "hl.dsp.window.move({ workspace = '-1' })")
        (mkRepeatBindLuaKey "kbWindowGroupCycleNext" "hl.dsp.exec_cmd('hyprctl dispatch cyclenext')")
        (mkRepeatBindLuaKey "kbWindowGroupCyclePrev" "hl.dsp.exec_cmd('hyprctl dispatch cyclenext prev')")
        (mkRepeatBind "CTRL + ALT + Tab" "hl.dsp.exec_cmd('hyprctl dispatch changegroupactive f')")
        (mkRepeatBind "CTRL + SHIFT + ALT + Tab" "hl.dsp.exec_cmd('hyprctl dispatch changegroupactive b')")

        # ================================
        # Restart/Kill Binds (bindr)
        # ================================
        (mkReleaseBind "CTRL + SUPER + SHIFT + R" "hl.dsp.exec_cmd('qs -c caelestia kill')")
        (mkReleaseBind "CTRL + SUPER + ALT + R" "hl.dsp.exec_cmd('qs -c caelestia kill; caelestia shell -d')")
      ];
    };
  };
}
