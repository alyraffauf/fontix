{
  config,
  lib,
  ...
}: {
  options.fontix.ghostty.enable = lib.mkEnableOption "Ghostty font settings";

  config = lib.mkIf config.fontix.ghostty.enable {
    programs.ghostty.settings = {
      font-family = [
        config.fontix.fonts.monospace.name
        config.fontix.fonts.emoji.name
      ];

      font-size = config.fontix.sizes.applications;
    };
  };
}
