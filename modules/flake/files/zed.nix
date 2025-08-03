_: {
  perSystem = {
    lib,
    pkgs,
    ...
  }: {
    files.files = [
      {
        checkFile = false;
        path_ = ".zed/settings.json";

        drv = (pkgs.formats.json {}).generate "zed-setting.json" {
          auto_install_extensions = {
            nix = true;
          };

          languages = {
            Markdown = {
              format_on_save = "on";

              formatter.external = {
                command = lib.getExe pkgs.prettier;
                arguments = ["--stdin-filepath" "{buffer_path}"];
              };
            };

            Nix = {
              format_on_save = "on";
              formatter = "language_server";
              language_servers = ["nixd"];
            };
          };

          lsp.nixd = {
            binary.path = lib.getExe pkgs.nixd;
            settings.formatting.command = [(lib.getExe pkgs.alejandra) "--quiet" "--"];
          };
        };
      }
    ];
  };
}
