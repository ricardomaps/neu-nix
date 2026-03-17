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
  fetchFromSourcehut,
  patches ? [],
  xwaylandSupport ? true,
}:
stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuswc";
    rev = "bf9503ad5088c14dd175c95b7cd298e8bfe23976";
    hash = "sha256-ue1z/dabHgcWXDq1ahJPrH6IxbsSDUbPtfDYWLBULWQ=";
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

  inherit patches;

  meta = {
    description = "Fork of swc for hevel window manager";
    homepage = "https://git.sr.ht/~shrub900/neuswc";
    license = lib.licenses.isc;
    mainProgram = "swc-launch";
  };
}
