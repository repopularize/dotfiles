_: ''
  * {
    font-family: "Inter";
    font-weight: 500;
    font-size: 15px;
  }

  #window {
    background-color: #242424;
    background-opacity: 0.8;
    border: 1.25px solid @mauve;
    color: #ffffff;
    border-radius: 10px;
  }

  #outer-box {
    padding: 20px;
  }

  #input {
    background-color: #1e1e1e;
    padding: 8px 12px;
    
    border-radius: 10px;
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
    color: @mauve;
  }

  #text:selected {
    color: black;
  }

  #entry {
    padding: 3px;
    border-radius: 5px;
    transition: 0.3s;
  }

  #entry:selected {
    background-color: @mauve;
    padding-left: 35px;
    text-align: center;
  }

  #unselected {}

  #selected {}

  #input,
  #entry:selected {
    border-radius: 5px;
  }
''
