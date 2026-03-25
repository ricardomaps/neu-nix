{ pkgs }:
import ./packages {
  inherit pkgs;
  inherit (pkgs) lib;
}
