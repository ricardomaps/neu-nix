{
  lib,
  meson,
  pkg-config,
  wayland-scanner,
  libdrm,
  neuwld,
  wayland,
  xwayland,
  wayland-protocols,
  pixman,
  udev,
  ninja,
  fontconfig,
  libxkbcommon,
  libinput,
  libxcb,
  libxcb-wm,
  stdenv,
  fetchgit,
  patches ? [ ],
  xwaylandSupport ? true,
  extra ? true,
  example ? false,
}:
stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchgit {
    url = "https://srcdump.net/shrub/neuswc.git";
    rev = "5d32737";
    hash = "sha256-6umDisPrdqxd7vXV6QANROOMBLUAQr4hUuDdrPEq80E=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    wayland-scanner
    libdrm
  ];

  buildInputs = [
    neuwld
    wayland
    wayland-protocols
    pixman
    libdrm
    udev
    libxkbcommon
    libinput
    fontconfig
  ]
  ++ lib.optionals xwaylandSupport [
    xwayland
    libxcb
    libxcb-wm
  ];

  mesonAutoFeatures = "auto";

  mesonFlags = [
    "-Dextra=${lib.boolToString extra}"
    "-Dexample=${lib.boolToString example}"
  ];

  inherit patches;

  meta = {
    description = "Slighly less simple wayland compositing library";
    homepage = "https://srcdump.net/shrub/neuswc";
    license = lib.licenses.isc;
    mainProgram = "swc-launch";
  };
}
