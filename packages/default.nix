{ pkgs, lib, ... }:
let
  wrapWithSwcLaunch = swc: pkg:
    let
      launcher = pkgs.writeShellScriptBin "${lib.getName pkg}-launch" ''
        exec ${swc}/bin/swc-launch ${lib.getExe pkg} "$@"
      '';
    in
    pkgs.symlinkJoin {
      name = "${lib.getName pkg}-wrapped";
      paths = [ pkg launcher ];
    };
  scope = pkgs.lib.makeScope pkgs.newScope (self: {
    neuwld = self.callPackage ./neuwld { };
    neuswc = self.callPackage ./neuswc { };
    neumenu = self.callPackage ./neumenu { };
    hevel = wrapWithSwcLaunch self.neuswc (self.callPackage ./hevel { });
    shko = wrapWithSwcLaunch self.neuswc (self.callPackage ./shko { });
    swall = self.callPackage ./swall { };
    hack = self.callPackage ./hack { };
    swclock = self.callPackage ./swclock { };
    swiv = self.callPackage ./swiv { };
    mojito = self.callPackage ./mojito { };
    hst = self.callPackage ./hst { };
  });
in
{
  inherit (scope)
    neuwld
    neuswc
    neumenu
    shko
    hevel
    swall
    hack
    swclock
    swiv
    mojito
    hst;
}
