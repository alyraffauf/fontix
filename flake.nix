{
  description = "Font framework for NixOS, Darwin, and home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    actions-nix.url = "github:alyraffauf/actions.nix";

    files.url = "github:alyraffauf/files";
    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];

      imports = [
        ./modules/flake
        inputs.files.flakeModules.default
        inputs.git-hooks-nix.flakeModule
        inputs.home-manager.flakeModules.home-manager
        inputs.treefmt-nix.flakeModule
        inputs.actions-nix.flakeModules.default
      ];
    };
}
