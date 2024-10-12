_: ''
  @define-color base #1e1e2e;
  @define-color mantle #181825;
  @define-color crust #11111b;

  @define-color text #cdd6f4;
  @define-color subtext0 #a6adc8;
  @define-color subtext1 #bac2de;

  @define-color surface0 #313244;
  @define-color surface1 #45475a;
  @define-color surface2 #585b70;

  @define-color overlay0 #6c7086;
  @define-color overlay1 #7f849c;
  @define-color overlay2 #9399b2;

  @define-color blue #89b4fa;
  @define-color lavender #b4befe;
  @define-color sapphire #74c7ec;
  @define-color sky #89dceb;
  @define-color teal #94e2d5;
  @define-color green #a6e3a1;
  @define-color yellow #f9e2af;
  @define-color peach #fab387;
  @define-color maroon #eba0ac;
  @define-color red #f38ba8;
  @define-color mauve #cba6f7;
  @define-color pink #f5c2e7;
  @define-color flamingo #f2cdcd;
  @define-color rosewater #f5e0dc;

  @define-color white #ffffff;

  * {
    border: none;
    border-radius: 0;
    font-family: Inter, monospace, Noto Sans CJK JP;
    font-weight: normal;
    font-size: 14px;
    min-height: 0;
  }

  window#waybar {
    background: rgba(0,0,0,0);
    border-radius: 10px;
    color: #cdd6f4;
  }

  tooltip {
    background: #1e1e2e;
    border-radius: 10px;
    border-width: 1.25px;
    border-style: solid;
    border-color: #11111b;
  }

  #workspaces button {
    padding: 5px 2px;
    color: #313244;
    margin-right: 5px;
    transition: 0.25s;
    border-radius: 5px;
  }

  #workspaces button.active {
    color: @text;
    background-color: @mantle;
  }

  #workspaces button.focused {
    color: @mauve;
    background: #eba0ac;
  }

  #workspaces button.urgent {
    color: @red;
    background: #a6e3a1;
  }

  #workspaces button:hover {
    background: @base;
    color: #cdd6f4;
  }

  #custom-language,
  #custom-logout,
  #custom-updates,
  #custom-caffeine,
  #custom-weather,
  #taskbar,
  #window,
  #clock,
  #battery,
  #pulseaudio,
  #network,
  #workspaces,
  #tray,
  #battery,
  #custom-launcher,
  #backlight {
    background: @mantle;
    padding: 0px 20px;
    margin: 1.25px;
    border-radius: 10px;
    color: @white;
  }

  #taskbar {
    padding: 0px 3px;
  }

  #workspaces {
    padding-right: 0px;
    padding-left: 5px;
  }

  #window {
    background: @mantle;
    margin-left: 3px;
    margin-right: 3px;
    transition: 0.3s;
  }

  #window:hover {
    background: @base;
  }

  #custom-launcher {
    font-size: 16px;
    padding-right: 12.5px;
    padding-left: 12.5px;
  }
''
