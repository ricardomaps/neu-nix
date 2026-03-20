{
  fetchFromSourcehut,
  stdenv,
  wayland-scanner,
  wayland,
  pkg-config,
  pixman,
  neuwld,
  fontconfig,
}:
stdenv.mkDerivation {
  pname = "swiv";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "swiv";
    rev = "53948d6838123df4bb5840e13ebd4cfc4ec92e23";
    hash = "sha256-z0a5b6yn6ti4oy63SpOZtbYziNOOYG0Z0Er64pvSlFw=";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    pixman
    wayland
    neuwld
    fontconfig
  ];

  makeFlags = [
    "DESTDIR=$(out)"
    "BINDIR=/bin"
  ];

  meta = {
    description = "A simple wayland image viewer";
    homepage = "https://git.sr.ht/~shrub900/swiv";
    mainProgram = "swiv";
  };
}
