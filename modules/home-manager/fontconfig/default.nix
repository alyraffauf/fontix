{
  config,
  lib,
  ...
}: {
  options.fontix.fontconfig.enable = lib.mkEnableOption "Fontconfig setup";

  config = lib.mkIf config.fontix.fontconfig.enable {
    fonts.fontconfig.defaultFonts = {
      emoji = [config.fontix.fonts.emoji.name];
      monospace = [config.fontix.fonts.monospace.name];
      sansSerif = [config.fontix.fonts.sansSerif.name];
      serif = [config.fontix.fonts.serif.name];
    };
  };
}
