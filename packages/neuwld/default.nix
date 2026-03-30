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
  fetchFromSourcehut,
}:
stdenv.mkDerivation {
  pname = "neuwld";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuwld";
    rev = "6446a28168045efffa8ccd3de0b6eb3599fb5339";
    hash = "sha256-rP03qodS9zUKJ6WPxPlu/sn+yRWc6jssa10mVPEjodc=";
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
    homepage = "https://git.sr.ht/~shrub900/neuwld";
    license = lib.licenses.mit;
  };
}
