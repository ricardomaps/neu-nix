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
  patches ? [ ],
  xwaylandSupport ? true,
}:
stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuswc";
    rev = "9c75f09d262ec03a1aa381184b4710172fb75c75";
    hash = "sha256-YkPcKDIIzS+NtX+NHRYzXHAss99BMS2uAbiFitWqTXE=";
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

  inherit patches;

  postInstall = ''
    mkdir -p $out/include
    wayland-scanner client-header $src/protocol/swc.xml $out/include/swc-client-protocol.h
  '';

  meta = {
    description = "Fork of swc for hevel window manager";
    homepage = "https://git.sr.ht/~shrub900/neuswc";
    license = lib.licenses.isc;
    mainProgram = "swc-launch";
  };
}
