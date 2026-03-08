{ pkgs, ... }:
let
  scope = pkgs.lib.makeScope pkgs.newScope (self: {
    neuwld = self.callPackage ./neuwld { };
    neuswc = self.callPackage ./neuswc { };
    neumenu = self.callPackage ./neumenu { };
    hevel = self.callPackage ./hevel { };
    shko = self.callPackage ./shko { };
    swall = self.callPackage ./swall { };
  });
in
{
  inherit (scope) neuwld neuswc neumenu shko hevel swall;
}
