{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    crate2nix = {
      url = "github:nix-community/crate2nix";
      # url = "github:tilpner/crate2nix/git-workspaces";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, crate2nix }:
    let
      system = "x86_64-linux";
    in {
      packages.${system}.default =
        let
          pkgs = nixpkgs.legacyPackages.${system};
          crate2nixTools = pkgs.callPackage "${crate2nix}/tools.nix" {};
          cargoNix = crate2nixTools.generatedCargoNix {
            name = "crate2nix-git-workspaces";
            src = ./.;
          };
          workspace = import cargoNix { inherit pkgs; };
      in workspace.rootCrate.build;
    };
}
