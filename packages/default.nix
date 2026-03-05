{ pkgs, ... }:
let
  scope = pkgs.lib.makeScope pkgs.newScope (self: {
    neuwld      = self.callPackage ./neuwld    { };
    neuswc      = self.callPackage ./neuswc    { };
    shko        = self.callPackage ./shko      { };
  });
in
{
  inherit (scope) wld swc shko;
}
