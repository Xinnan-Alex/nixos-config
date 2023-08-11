{ pkgs, ... }:

{

  home.packages = [ ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {

        layer = "top";

        modules-left = [
          "hyprland/workspaces"
          "hyprland/language"
          "hyprland/window"
        ];

        modules-center = [ ];

        modules-right = [
          "network"
          "pulseaudio"
          "battery"
          "cpu"
          "memory"
          "clock"
          "tray"
        ];

        mpd = {
          tooltip = false;
          format = "{stateIcon} {artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S})";
          format-disconnected = "ﳌ";
          format-stopped = "";
          state-icons = {
            playing = "";
            paused = "";
          };
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}%";
          format-muted = "󰖁 ";
          format-icons = {
            "headphone" = "󰋋 ";
            "hands-free" = " ";
            "headset" = "󰋎 ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = [
              "󰕾 "
              "󰕾 "
            ];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
          on-click-right = "amixer set Master toggle";
          ignored-sinks = [
            "Easy Effects Sink"
          ];
        };

        network = {
          tooltip = false;
          format-wifi = "  {essid}";
          format-ethernet = " {ipaddr}";
        };

        cpu = {
          tooltip = false;
          format = " {}%";
        };

        memory = {
          tooltip = false;
          format = " {}%";
        };

        "hyprland/window" = {
          format = "👉 {title}";
          separate-outputs = true;
        };

        "hyprland/language" = {
          format = "{}";
        };

        battery = {
          bat = "BAT0";
          interval = 60;
          states = {
            "warning" = 30;
            "critical" = 15;
          };
          format = "{capacity}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };

        clock = {
          format = "{:%H:%M}";
          format-alt = "  {:%A, %B %d, %Y (%R)}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              "months" = "<span color='#ffead3'><b>{}</b></span>";
              "days" = "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
              "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };
      };
    };
    style = ''
      @import "/home/alex/nix-config/home-manager/desktop/mocha.css";
      * {
        border: none;
        border-radius: 0;
        font-family: Nerd Font Hack;
        font-size: 14px;
        min-height: 24px;
        color:@text;
      }

      window#waybar {
        background: transparent;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #window {
        margin-top: 8px;
        padding-left: 16px;
        padding-right: 16px;
        border-radius: 10px;
        transition: none;
        background: transparent;
      }

      window#waybar.termite #window,
      window#waybar.Firefox #window,
      window#waybar.Navigator #window,
      window#waybar.PCSX2 #window {
          color: #4d4d4d;
        background: #e6e6e6;
      }

      #workspaces {
        margin-top: 8px;
        margin-left: 12px;
        margin-bottom: 0;
        border-radius: 26px;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
        transition: none;
      }

      #workspaces button {
        transition: none;
        background-color: @base;
        font-size: 16px;
      }

      #workspaces button:hover {
        transition: none;
        box-shadow: inherit;
        text-shadow: inherit;
        background-color: @sky;
      }

      #workspaces button.active{
        border-radius:26px;
        box-shadow: inherit;
        text-shadow: inherit;
        color:#282a36;
        transition: none;
        background-color: shade(@crust,0.9);
      }

      #mpd {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        background: #282a36;
        transition: none;
        color: #f8f8f2;
        background: #5af78e;
      }

      #mpd.disconnected,
      #mpd.stopped {
        color: #f8f8f2;
        background: #282a36;
      }

      #network {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #pulseaudio {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #temperature {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #cpu {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #memory {
        margin-top: 8px;
        margin-left: 8px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #clock {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #language {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #window {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #submap {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #battery {
        margin-top: 8px;
        margin-left: 8px;
        margin-right: 12px;
        padding-left: 16px;
        padding-right: 16px;
        margin-bottom: 0;
        border-radius: 26px;
        transition: none;
        background-color: shade(@base, 0.9);
        border: 2px solid alpha(@crust, 0.3);
      }

      #battery.warning{
        color:#Ffa500;
      }

      #battery.critical{
        color:#Ff0000;
      }

      #pulseaudio.muted{
        color:#Ff0000;
      }

    '';
  };
}
