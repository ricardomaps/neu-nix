{
  lib,
  writeText,
  stdenv,
  writeShellScriptBin,
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
  configZig ? null,
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

  dontSetZigDefaultFlags = true;
  nativeBuildInputs = [
    zig.hook
    (writeShellScriptBin "shko-launch" ''
      exec ${neuswc}/bin/swc-launch $out/bin/shko "$@"
    '')
  ];

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

  postPatch =
    let
      configZigFile =
        if lib.isDerivation configZig || builtins.isPath configZig then
          configZig
        else
          writeText "config.zig" configZig;
    in
    lib.optionalString (configZig != null) "cp ${configZigFile} config.zig";

  meta = {
    description = "Keyboard-oriented, floating, zomming, scrolling window manager";
    homepage = "https://git.sr.ht/~chld/shko";
    license = lib.licenses.unlicense;
    mainProgram = "shko";
  };
}
