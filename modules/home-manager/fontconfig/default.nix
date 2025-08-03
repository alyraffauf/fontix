{
  config,
  lib,
  ...
}: {
  options.fontix.fontconfig.enable = lib.mkEnableOption "Fontconfig setup";

  config = lib.mkIf config.fontix.fontconfig.enable {
    fonts.fontconfig.defaultFonts = {
      emoji = [config.fontix.emoji.name];
      monospace = [config.fontix.monospace.name];
      sansSerif = [config.fontix.sansSerif.name];
      serif = [config.fontix.serif.name];
    };
  };
}
