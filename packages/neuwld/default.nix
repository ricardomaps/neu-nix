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
    rev = "a86df06235cf1e1e78949593c18302850cf9d7cd";
    hash = "sha256-MTzECQu0N33Q87vAuUALQd+JVaC647PY2XyOJw9yEpA=";
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
