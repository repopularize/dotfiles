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
    font-family: "Inter";
    font-weight: 500;
    font-size: 15px;
  }

  #window {
    background-color: rgb(30, 30, 46, 0.7);
    background-opacity: 0.6;
    color: @rosewater;
    border-radius: 0px;
  }

  #outer-box {
    padding: 20px;
  }

  #input {
    background-color: @mantle;
    padding: 8px 12px;
    border-radius: 0px;
  }

  #scroll {
    margin-top: 20px;
  }

  #inner-box {}

  #img {
    padding-right: 8px;
  }

  #text {
    transition: 0.3s;
    color: @rosewater;
  }

  #text:selected {
    color: black;
  }

  #entry {
    padding: 3px;
    transition: 0.3s;
  }

  #entry:selected {
    background-color: @rosewater;
    padding-left: 35px;
    text-align: center;
  }

  #unselected {}

  #selected {}

  #input,
  #entry:selected {
    border-radius: 0px;
  }
''
