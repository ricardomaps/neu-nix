{
  description = "Neulibs packages for nix";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      overlays.default =
        final: prev:
        import ./. {
          pkgs = final;
        };

      packages = forAllSystems (system: import ./. { pkgs = nixpkgs.legacyPackages.${system}; });

      devShell = forAllSystems (
        system:
        let
          callPackage = nixpkgs.legacyPackages.${system}.callPackage;
        in
        callPackage ./shell.nix { }
      );
    };
}
