{
  flake.templates = {
    rust = {
      path = ./rust;
      description = "A rust project template";
    };

    node = {
      path = ./node;
      description = "A nodejs project template";
    };
  };
}