{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in rec {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            gnumake
            hugo
          ];
        };
      }
    );
}
