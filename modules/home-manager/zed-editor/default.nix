{
  config,
  lib,
  ...
}: {
  options.fontix.zed-editor.enable = lib.mkEnableOption "Zed Editor font settings";

  config = lib.mkIf config.fontix.zed-editor.enable {
    programs.zed-editor.userSettings = {
      "buffer_font_family" = config.fontix.fonts.monospace.name;
      "buffer_font_size" = config.fontix.sizes.applications * 4.0 / 3.0;
      "ui_font_family" = config.fontix.fonts.sansSerif.name;
      "ui_font_size" = config.fontix.sizes.applications * 4.0 / 3.0;
    };
  };
}
