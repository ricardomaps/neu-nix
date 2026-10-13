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
  videoBackend ? "drm",
  }:

assert lib.assertOneOf "videoBackend" videoBackend [ "drm" "fb" ];
assert lib.assertMsg (xwaylandSupport -> videoBackend == "drm") "Xwayland requires the DRM video backend";

stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchgit {
    url = "https://srcdump.net/shrub/neuswc.git";
    rev = "d1ec3e24c7e0b7400dc5c0e4dfb7194e805a489d";
    hash = "sha256-6QOMs94SrW/RnYd8oZFgx5IBipDCH61cnEUdVNgknPo=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    (neuwld.override { drmSupport = videoBackend == "drm"; })
    wayland
    pixman
    libxkbcommon
    fontconfig
    wayland-protocols
  ]
  ++ lib.optionals xwaylandSupport [
    xwayland
    libxcb
    libxcb-wm
  ]
  # the oasislinux libinput fork is the only way to build with libinput but without udev
  ++ lib.optionals stdenv.hostPlatform.isLinux [ libinput udev ]
  ++ lib.optional (videoBackend == "drm") libdrm;

  mesonAutoFeatures = "auto";

  mesonFlags = [
    (lib.mesonEnable "xwayland" xwaylandSupport)
    (lib.mesonOption "video" videoBackend)
  ];

  inherit patches;

  meta = {
    description = "Fork of swc created by wayland.fyi.";
    homepage = "https://srcdump.net/shrub/neuswc";
    platforms = lib.platforms.unix;
    license = lib.licenses.mit;
    mainProgram = "swc-launch";
  };
}
