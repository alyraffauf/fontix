_: {
  perSystem = {
    lib,
    pkgs,
    ...
  }: {
    files.files = [
      {
        checkFile = false;
        path_ = ".helix/languages.toml";

        drv = (pkgs.formats.toml {}).generate "helix-languages.toml" {
          language = [
            {
              name = "nix";
              auto-format = true;
              formatter = {command = lib.getExe pkgs.alejandra;};
              language-servers = ["nixd"];
            }
          ];

          language-server = {
            nixd = {
              command = lib.getExe pkgs.nixd;
            };
          };
        };
      }
    ];
  };
}
