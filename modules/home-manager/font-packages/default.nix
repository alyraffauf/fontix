{
  config,
  lib,
  ...
}: {
  options.fontix.font-packages.enable = lib.mkEnableOption "Font packages";

  config = lib.mkIf config.fontix.font-packages.enable {
    home.packages = [
      config.fontix.emoji.package
      config.fontix.monospace.package
      config.fontix.sansSerif.package
      config.fontix.serif.package
    ];
  };
}
