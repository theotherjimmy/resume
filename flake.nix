{
  description = "Build my resume";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils/master";
  };
  outputs = { self, nixpkgs, flake-utils }:
    let
      mkLatexShell = pkgs: pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          gnumake
          texlive.combined.scheme-medium
        ];
      };
    in flake-utils.lib.eachDefaultSystem (system: {
      devShell = mkLatexShell (import nixpkgs { inherit system; });
    });
}
