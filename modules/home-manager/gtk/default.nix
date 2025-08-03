{
  config,
  lib,
  ...
}: {
  options.fontix.gtk.enable = lib.mkEnableOption "Gtk fonts";

  config = lib.mkIf config.fontix.gtk.enable {
    gtk.font = {
      inherit (config.fontix.fonts.sansSerif) name package;
      size = config.fontix.sizes.applications;
    };
  };
}
