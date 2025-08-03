_: {
  perSystem = {
    config,
    lib,
    pkgs,
    self',
    ...
  }: {
    devShells.default = pkgs.mkShell {
      packages =
        lib.attrValues config.treefmt.build.programs ++ [self'.packages.gen-files];

      shellHook = ''
        echo "Installing pre-commit hooks..."
        ${config.pre-commit.installationScript}
        echo "Generating files..."
        ${lib.getExe self'.packages.gen-files}
        echo "👋 Welcome to the fontix devShell!"
      '';
    };
  };
}
