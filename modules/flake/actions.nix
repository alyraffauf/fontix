_: {
  flake.actions-nix = {
    pre-commit.enable = true; # Set to true if you want pre-commit workflow generation

    workflows = {
      # check-nix.yml
      ".github/workflows/check-nix.yml" = {
        name = "check-nix";
        concurrency = {
          cancel-in-progress = true;
          group = "\${{ github.workflow }}-\${{ github.ref }}";
        };
        on = {
          push = {
            paths-ignore = [
              "**/*.md"
              ".github/**"
              "_img/**"
            ];
          };
          workflow_dispatch = {};
        };
        jobs = {
          check-flake = {
            runs-on = "ubuntu-latest";
            steps = [
              {
                uses = "actions/checkout@main";
                "with" = {fetch-depth = 1;};
              }
              {uses = "DeterminateSystems/nix-installer-action@main";}
              {
                name = "Check flake evaluation";
                run = "nix -Lv flake check --all-systems";
              }
            ];
          };
        };
      };

      # update-inputs.yml
      ".github/workflows/update-inputs.yml" = {
        name = "update-inputs";
        on = {
          schedule = [
            {cron = "0 6 * * 5";}
          ];
          workflow_dispatch = {};
        };
        jobs = {
          update-flake-lock = {
            runs-on = "ubuntu-latest";
            steps = [
              {
                uses = "actions/checkout@main";
                "with" = {
                  ref = "\${{ github.head_ref }}";
                  fetch-depth = 1;
                };
              }
              {
                name = "Setup Git";
                run = ''
                  git config --local user.name  "github-actions[bot]"
                  git config --local user.email  "github-actions[bot]@users.noreply.github.com"
                '';
              }
              {uses = "DeterminateSystems/nix-installer-action@main";}
              {
                uses = "DeterminateSystems/update-flake-lock@main";
                "with" = {
                  token = "\${{ secrets.FLAKE_UPDATE_PAT }}";
                  pr-title = "flake: update inputs";
                  pr-assignees = "alyraffauf";
                  pr-labels = ''
                    dependencies
                    automated
                  '';
                };
              }
            ];
          };
        };
      };
    };
  };
}
