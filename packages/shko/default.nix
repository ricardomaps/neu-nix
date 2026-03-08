{
  lib,
  writeText,
  stdenv,
  fetchFromCodeberg,
  pixman,
  libdrm,
  wayland,
  libinput,
  libxkbcommon,
  libxcb,
  libxcb-wm,
  zig,
  neuswc,
  neuwld,
  config ? null,
}:

stdenv.mkDerivation {
  pname = "shko";
  version = "0.1.0";
  src = fetchFromCodeberg {
    owner = "chld";
    repo = "shko";
    rev = "e72377af2bc7a7fa309a8205af8d0e01943dcbd7";
    hash = "sha256-z+/UPQxpmPfyxMt2Cr50u+rLK8VQZHrO3oPE2hEvGwg=";
  };

  nativeBuildInputs = [ zig.hook ];
  dontSetZigDefaultFlags = true;

  buildInputs = [
    libdrm
    libinput
    pixman
    neuswc
    neuwld
    wayland
    libxkbcommon
    libxcb
    libxcb-wm
  ];

  postInstall = ''
  printf '#!/bin/sh\nexec swc-launch %s "$@"\n' "$out/bin/shko" > $out/bin/shko-launch
  chmod +x $out/bin/shko-launch
'';

  postPatch =
    let
      configFile =
        if lib.isDerivation config || builtins.isPath config then config else writeText "config.zig" config;
    in
    lib.optionalString (config != null)  "cp ${configFile} config.zig";

}
