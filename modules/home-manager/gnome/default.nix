{
  config,
  lib,
  ...
}: {
  options.fontix.gnome.enable = lib.mkEnableOption "GNOME desktop fonts";

  config = lib.mkIf config.fontix.gnome.enable {
    dconf = {
      enable = true;

      settings."org/gnome/desktop/interface" = {
        document-font-name = "${config.fontix.fonts.serif.name} ${toString (config.fontix.sizes.applications - 1)}";
        font-name = "${config.fontix.fonts.sansSerif.name} ${toString config.fontix.sizes.applications}";
        monospace-font-name = "${config.fontix.fonts.monospace.name} ${toString config.fontix.sizes.applications}";
      };
    };
  };
}
