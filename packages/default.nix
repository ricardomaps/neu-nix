{ pkgs, ... }:
let
  scope = pkgs.lib.makeScope pkgs.newScope (self: {
    neuwld      = self.callPackage ./neuwld    { };
    neuswc      = self.callPackage ./neuswc    { };
    neumenu     = self.callPackage ./neumenu   { };
    hevel       = self.callPackage ./hevel     { };
    shko        = self.callPackage ./shko      { };
  });
in
{
  inherit (scope) wld swc shko;
}
