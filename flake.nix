{
  description = "PDF file cutter for slides where 2 pages are in one of the file";

  inputs = {
    pyproject-nix.url = "github:nix-community/pyproject.nix";
    pyproject-nix.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, pyproject-nix, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        project = pyproject-nix.lib.project.loadPyproject {
          projectRoot = self;
        };
        pkgs = nixpkgs.legacyPackages.${system};
        python = pkgs.python3;
      in
      {
        devShells.default =
          let
            arg = project.renderers.withPackages { inherit python; };
            pythonEnv = python.withPackages arg;
          in
            pkgs.mkShell { packages = [ pythonEnv ]; };

        packages.default =
          let
            attrs = project.renderers.buildPythonPackage { inherit python; };
          in
            python.pkgs.buildPythonPackage (attrs // {
              version = "${builtins.toString self.lastModified}+flake";
            });
      }
    );
}
