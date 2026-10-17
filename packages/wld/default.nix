{
  lib,
  stdenv,
  fetchFromGitHub,
  pixman,
  pkg-config,
  wayland-scanner,
  wayland,
  fontconfig,
  freetype,
  libdrm
}:
stdenv.mkDerivation {
  pname = "wld";
  version = "0.0";
  src = fetchFromGitHub {
    owner = "michaelforney";
    repo = "wld";
    rev = "beceef214d3a69f4488fe1ec2674e1016ceb0988";
    hash = "sha256-pkKCPRXOFah917c965fFk8SxheiFpWxPE31cuxs0CN4=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  makeFlags = [
    "PREFIX=$(out)"
  ];

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
    libdrm
    freetype
    pixman
    fontconfig
  ];

  meta = {
    description = "wld is a drawing library that targets Wayland";
    homepage = "https://github.com/michaelforney/wld";
    license = lib.licenses.mit;
  };
}
