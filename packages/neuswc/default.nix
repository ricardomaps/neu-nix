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
  udevSupport ? true,
  videoBackend ? "drm",
  }:

assert lib.assertOneOf "videoBackend" videoBackend [ "drm" "fb" ];
assert lib.assertMsg (xwaylandSupport -> videoBackend == "drm") "Xwayland requires the DRM video backend";

stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchgit {
    url = "https://srcdump.net/shrub/neuswc.git";
    rev = "5d32737";
    hash = "sha256-6umDisPrdqxd7vXV6QANROOMBLUAQr4hUuDdrPEq80E=";
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
    neuwld
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
  ++ lib.optional stdenv.hostPlatform.isLinux libinput
  ++ lib.optional (stdenv.hostPlatform.isLinux && udevSupport) udev
  ++ lib.optional (videoBackend == "drm") libdrm;

  mesonAutoFeatures = "auto";

  mesonFlags = [
    (lib.mesonEnable "xwayland" xwaylandSupport)
    (lib.mesonEnable "udev" udevSupport)
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
