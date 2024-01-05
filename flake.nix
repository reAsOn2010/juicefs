{
  description = "juicefs with nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import inputs.nixpkgs
            {
              inherit system;
              # config = {
              #   permittedInsecurePackages = [
              #     "openssl-1.1.1w"
              #   ];
              # };
            };
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              go
              pre-commit
              gnumake
            ];
            shellHook = ''
            '';
          };
        });
}
