{
  config,
  lib,
  ...
}: {
  options.fontix.vscode = {
    enable = lib.mkEnableOption "VSCode font settings";

    profiles = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = ["default"];
      description = "Which VSCode profiles to apply font settings to. Defaults to just the 'default' profile.";
    };
  };

  config = lib.mkIf config.fontix.vscode.enable {
    programs.vscode.profiles = lib.genAttrs config.fontix.vscode.profiles (_: {
      userSettings = {
        "chat.editor.fontFamily" = config.fontix.fonts.monospace.name;
        "chat.editor.fontSize" = config.fontix.sizes.applications * 4.0 / 3.0;
        "debug.console.fontFamily" = config.fontix.fonts.monospace.name;
        "debug.console.fontSize" = config.fontix.sizes.applications * 4.0 / 3.0;
        "editor.fontFamily" = config.fontix.fonts.monospace.name;
        "editor.fontSize" = config.fontix.sizes.applications * 4.0 / 3.0;
        "editor.inlayHints.fontFamily" = config.fontix.fonts.monospace.name;
        "editor.inlineSuggest.fontFamily" = config.fontix.fonts.monospace.name;
        "editor.minimap.sectionHeaderFontSize" = config.fontix.sizes.applications * 4.0 / 3.0 * 9.0 / 14.0;
        "markdown.preview.fontFamily" = config.fontix.fonts.sansSerif.name;
        "markdown.preview.fontSize" = config.fontix.sizes.applications * 4.0 / 3.0;
        "scm.inputFontFamily" = config.fontix.fonts.monospace.name;
        "scm.inputFontSize" = config.fontix.sizes.applications * 4.0 / 3.0 * 13.0 / 14.0;
        "screencastMode.fontSize" = config.fontix.sizes.applications * 4.0 / 3.0 * 56.0 / 14.0;
        "terminal.integrated.fontSize" = config.fontix.sizes.applications * 4.0 / 3.0;
      };
    });
  };
}
