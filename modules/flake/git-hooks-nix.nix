_: {
  perSystem = _: {
    pre-commit.settings.hooks = {
      alejandra.enable = true;
      deadnix.enable = true;
      prettier.enable = true;

      statix.enable = true;
    };
  };
}
