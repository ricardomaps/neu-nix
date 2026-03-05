{
  bmake,
  pkg-config,
  wayland-scanner,
  libdrm,
  wld,
  wayland,
  wayland-protocols,
  pixman,
  libudev0-shim,
	libxkbcommon,
	fontconfig,
	libinput,
	libxcb,
	libxcb-wm,
	stdenv,
	fetchFromSourcehut,
}:
stdenv.mkDerivation {
  pname = "swc";
  version = "0-unstable-2026-03-02";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "neuswc";
    rev = "f0147d3d9b84f5d81ad14260f08808afc563e54d";
    hash = "sha256-2y7nKZKKWQaxJSuz5ia4VIcR4ibsAt/M6oqDy5jRpg4=";
  };

  nativeBuildInputs = [
    bmake
    pkg-config
    wayland-scanner
    libdrm
  ];

  buildInputs = [
    wld
    wayland
    wayland-protocols
    pixman
    libdrm
    libudev0-shim
  	libxkbcommon
  	fontconfig
  	libinput
  	libxcb
  	libxcb-wm
  ];

  patchPhase = ''
    substituteInPlace Makefile \
      --replace "4755" "755"
  '';

  CFLAGS = "-I${libdrm.dev}/include/libdrm"; # Uncomment this line to fix compilation error

  makeFlags = ["PREFIX=$(out)"];
}


