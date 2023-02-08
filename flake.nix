{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    foundry.url = "github:matteojoliveau/nix-foundryvtt";
  };

  outputs = { self, nixpkgs, flake-utils, foundry }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs { inherit system; };
          foundryvtt = foundry.packages.${system}.foundryvtt;
        in
        {
          formatter = pkgs.nixpkgs-fmt;

          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              just
              nodejs-18_x
              foundryvtt
            ];
          };
        });
}
