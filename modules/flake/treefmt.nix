_: {
  perSystem = _: {
    treefmt.config = {
      programs = {
        alejandra.enable = true;
        deadnix.enable = true;
        prettier.enable = true;
        statix.enable = true;
      };
    };
  };
}
