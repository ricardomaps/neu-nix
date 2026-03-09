{
  lib,
  writeText,
  stdenv,
  fetchFromSourcehut,
  bmake,
  neuwld,
  neuswc,
  libinput,
  pixman,
  pkg-config,
  fontconfig,
  wayland,
  wayland-scanner,
  wayland-protocols,
  libdrm,
  libxkbcommon,
  libxcb,
  libxcb-wm,
  udev,
  conf ? null,
}:
stdenv.mkDerivation {
  pname = "hevel";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "hevel";
    rev = "bb9416a41ca7b33536a5f52a37752a854d68661c";
    hash = "sha256-oThop0LaQQthkr+9rVX0kGi528IcP4l29z41AjxbNJM=";
  };

  nativeBuildInputs = [
    bmake
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    libdrm
    libinput
    pixman
    neuswc
    neuwld
    wayland
    wayland-protocols
    libxkbcommon
    libxcb
    libxcb-wm
    udev
    fontconfig
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  postPatch =
  let
    configFile =
      if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.zig" conf;
  in
  lib.optionalString (conf != null)  "cp ${configFile} config.zig";
}
