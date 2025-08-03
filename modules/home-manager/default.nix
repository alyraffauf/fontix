{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./font-packages
    ./fontconfig
    ./ghostty
    ./gnome
    ./gtk
    ./zed-editor
  ];

  options.fontix = let
    mkFontOption = name: default: package: {
      name = lib.mkOption {
        type = lib.types.str;
        description = "Name of the ${name} font.";
        inherit default;
      };

      package =
        lib.mkPackageOption pkgs package {}
        // {
          description = "Package providing the ${name} font.";
        };
    };
  in {
    fonts = {
      emoji = mkFontOption "emoji" "Noto Color Emoji" "noto-fonts-color-emoji";
      monospace = mkFontOption "monospace" "DejaVu Sans Mono" "dejavu_fonts";
      sansSerif = mkFontOption "sansSerif" "DejaVu Sans" "dejavu_fonts";
      serif = mkFontOption "serif" "DejaVu Serif" "dejavu_fonts";
    };

    sizes = {
      applications = lib.mkOption {
        type = lib.types.either lib.types.float lib.types.int;
        default = 12;
        description = "Font size for applications.";
      };

      desktop = lib.mkOption {
        type = lib.types.either lib.types.float lib.types.int;
        default = 10;
        description = "Font size for desktop elements.";
      };
    };
  };
}
