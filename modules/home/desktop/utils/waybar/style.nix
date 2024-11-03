_: ''
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
    background: #242424;
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
