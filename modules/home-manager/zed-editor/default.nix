{
  config,
  lib,
  ...
}: {
  options.fontix.zed-editor.enable = lib.mkEnableOption "Zed Editor font settings";

  config = lib.mkIf config.fontix.zed-editor.enable {
    programs.zed-editor.userSettings = {
      "buffer_font_family" = config.fontix.monospace.name;
      "ui_font_family" = config.fontix.sansSerif.name;
    };
  };
}
