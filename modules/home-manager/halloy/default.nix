{
  config,
  lib,
  ...
}: {
  options.fontix.halloy.enable = lib.mkEnableOption "Halloy IRC client font settings";

  config = lib.mkIf config.fontix.halloy.enable {
    programs.halloy.settings.font = {
      family = config.fontix.fonts.monospace.name;
      size = config.fontix.sizes.applications;
    };
  };
}
