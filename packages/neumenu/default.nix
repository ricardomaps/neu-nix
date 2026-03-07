{
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  neuwld,
  neuswc,
  wayland-protocols,
  wayland-scanner,
  wayland,
  pixman,
  fontconfig,
  libxkbcommon,
}:
stdenv.mkDerivation {
  pname = "neumenu";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~uint";
    repo = "neumenu";
    rev = "88d0bd8bb47a3bea4e806087b4be95af226d5bb3";
    hash = "sha256-oASly6REP1EGV8jBROMZJR+Q8TrkVNKga4Yub37xjxo=";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland-protocols
    wayland
    neuwld
    libxkbcommon
    fontconfig
    pixman
  ];

  makeFlags = [
    "PREFIX=$(out)"
    "SWCPROTO=${neuswc}/share/swc/swc.xml"
  ];
}
