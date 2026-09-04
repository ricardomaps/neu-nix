{
  lib,
  meson,
  pkg-config,
  wayland-scanner,
  doxygen,
  ninja,
  fontconfig,
  pixman,
  freetype,
  libdrm,
  wayland,
  stdenv,
  fetchgit,
}:
stdenv.mkDerivation {
  pname = "neuwld";
  version = "0.0";

  src = fetchgit {
    url = "https://srcdump.net/shrub/neuwld.git";
    rev = "554f827";
    hash = "sha256-KAK4/TpNekaonN0yxi4/5mRdZL1uxYdGmwl41FRH5wU=";
  };

  nativeBuildInputs = [
    meson
    pkg-config
    wayland-scanner
    ninja
    doxygen
  ];

  buildInputs = [
    fontconfig
    pixman
    freetype
    libdrm
    wayland
  ];

  meta = {
    description = "A drawing library that targets Wayland";
    homepage = "https://srcdump.net/shrub/neuwld";
    license = lib.licenses.mit;
  };
}
