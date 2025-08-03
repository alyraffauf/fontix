{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./font-packages
    ./fontconfig
  ];

  options.fontix = let
    mkFontOption = name: default: package: {
      name = lib.mkOption {
        type = lib.types.str;
        description = "Name of the ${name} font.";
        inherit default;
      };

      package = lib.mkPackageOption pkgs package {
        description = "Package providing the ${name} font.";
      };
    };
  in {
    emoji = mkFontOption "emoji" "Noto Color Emoji" "noto-fonts-color-emoji";
    monospace = mkFontOption "monospace" "DejaVu Sans Mono" "dejavu_fonts";
    sans = mkFontOption "sans" "DejaVu Sans" "dejavu_fonts";
    serif = mkFontOption "serif" "DejaVu Serif" "dejavu_fonts";
  };
}
