{ pkgs, lib }:
let
  wrapWithSwcLaunch =
    swc: pkg:
    pkg.overrideAttrs (
      final: prev: {
        postInstall =
          let
            script = ''
              #!/usr/bin/env bash
              exec ${swc}/bin/swc-launch $out/bin/${pkg.meta.mainProgram} \"\$@\" 
            '';
            path = "$out/bin/${lib.getName pkg}-launch";
          in
          prev.postInstall or ""
          + ''
            echo "${script}" >> ${path}
            chmod +x ${path}
          '';
      }
    );
  scope = pkgs.lib.makeScope pkgs.newScope (self: {
    neuwld = self.callPackage ./neuwld { };
    neuswc = self.callPackage ./neuswc { };
    neumenu = self.callPackage ./neumenu { };
    hevel = wrapWithSwcLaunch self.neuswc (self.callPackage ./hevel { });
    shko = wrapWithSwcLaunch self.neuswc (self.callPackage ./shko { });
    wsxwm = wrapWithSwcLaunch self.neuswc (self.callPackage ./wsxwm { });
    tohu = wrapWithSwcLaunch self.neuswc (self.callPackage ./tohu { });
    neuwm = wrapWithSwcLaunch self.neuswc (self.callPackage ./neuwm { });
    slgro = wrapWithSwcLaunch self.neuswc (self.callPackage ./slgro { });
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
    hst
    wsxwm
    tohu
    neuwm
    slgro
    ;
}
