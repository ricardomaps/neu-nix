{
  stdenv,
  fetchFromSourcehut,
  lib,
  bmake,
  wld,
  swc,
  libinput,
  pixman,
  pkg-config,
  wayland,
  wayland-scanner,
  wayland-protocols,
  libdrm,
  libxkbcommon,
}:
stdenv.mkDerivation {
  pname = "hevel";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "hevel";
    rev = "82306105b1f8a50c90432038223c8e1b72166148";
    hash = lib.fakeHash;
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
    swc
    wld
    # libudev0-shim
    wayland
    wayland-protocols
    libxkbcommon
    # libxcb
    # libxcb-wm
  ];

  makeFlags = [ "PREFIX=$(out)" ];
}
