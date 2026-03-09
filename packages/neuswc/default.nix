{
  bmake,
  pkg-config,
  wayland-scanner,
  libdrm,
  neuwld,
  wayland,
  wayland-protocols,
  pixman,
  udev,
  libxkbcommon,
  fontconfig,
  libinput,
  libxcb,
  libxcb-wm,
  stdenv,
  fetchFromSourcehut,
  patches ? [],
}:
stdenv.mkDerivation {
  pname = "neuswc";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuswc";
    rev = "d7a9eda640d4b4d96f6158266099d3c3fe8e5673";
    hash = "sha256-2y7nKZKKWQaxJSuz5ia4VIcR4ibsAt/M6oqDy5jRpg4=";
  };

  nativeBuildInputs = [
    bmake
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
    fontconfig
    libinput
    libxcb
    libxcb-wm
  ];

  inherit patches;

  postPatch = ''
    substituteInPlace Makefile \
      --replace "4755" "755"
  '';

  CFLAGS = "-I${libdrm.dev}/include/libdrm";

  makeFlags = [
    "PREFIX=$(out)"
    "ENABLE_DEBUG=0"
  ];
}
