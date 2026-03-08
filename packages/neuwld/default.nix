{
  bmake,
  pkg-config,
  wayland-scanner,
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
    rev = "534372ea862c933f0e614a9dd77c5b44ddb18d10";
    hash = "sha256-fyCHP3rEeoUr+pWEebLaPW0bmgoVGlb7yzU281+yOSg=";
  };

  nativeBuildInputs = [
    bmake
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    fontconfig
    pixman
    freetype
    libdrm
    wayland
  ];

  makeFlags = [
    "PREFIX=$(out)"
    "ENABLE_SHARED=1"
    "ENABLE_STATIC=0"
    "ENABLE_WAYLAND=1"
    "ENABLE_DRM=1"
    "ENABLE_PIXMAN=1"
  ];

  outputs = [
    "out"
    "dev"
  ];
}
