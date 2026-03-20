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
  configZig ? null,
}:

stdenv.mkDerivation {
  pname = "shko";
  version = "0.1.0";
  src = fetchFromCodeberg {
    owner = "chld";
    repo = "shko";
    rev = "916a997a4a83d58d1628370f4a6237973db8042e";
    hash = "sha256-+jNlmGoKe58SKVY85UYF1s2fnMuPvE62wC+O3aAT4Gw=";
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

  postPatch =
    let
      configZigFile =
        if lib.isDerivation configZig || builtins.isPath configZig then configZig else writeText "config.zig" configZig;
    in
    lib.optionalString (configZig != null)  "cp ${configZigFile} config.zig";

  meta = {
    description = "Keyboard-oriented, floating, zomming, scrolling window manager";
    homepage = "https://git.sr.ht/~chld/shko";
    license = lib.licenses.unlicense;
    mainProgram = "shko";
  };
}
