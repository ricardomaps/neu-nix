{
  stdenv,
  fetchFromCodeberg,
  pixman,
  libdrm,
  wayland,
  libinput,
  libudev0-shim,
  libxkbcommon,
  libxcb,
  libxcb-wm,
  zig,
  neuswc,
  neuwld,
}:

stdenv.mkDerivation {
  pname = "shko";
  version = "0.1.0";
  src = fetchFromCodeberg {
    owner = "chld";
    repo = "shko";
    rev = "e72377af2bc7a7fa309a8205af8d0e01943dcbd7";
    hash = "sha256-z+/UPQxpmPfyxMt2Cr50u+rLK8VQZHrO3oPE2hEvGwg=";
  };

  nativeBuildInputs = [ zig.hook ];
  dontSetZigDefaultFlags = true;

  buildInputs = [
    libdrm
    libinput
    pixman
    neuswc
    neuwld
    libudev0-shim
    wayland
    libxkbcommon
    libxcb
    libxcb-wm
  ];
}
