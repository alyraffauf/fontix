{
  config,
  lib,
  ...
}: {
  options.fontix.font-packages.enable = lib.mkEnableOption "Font packages";

  config = lib.mkIf config.fontix.font-packages.enable {
    home.packages = [
      config.fontix.fonts.emoji.package
      config.fontix.fonts.monospace.package
      config.fontix.fonts.sansSerif.package
      config.fontix.fonts.serif.package
    ];
  };
}
