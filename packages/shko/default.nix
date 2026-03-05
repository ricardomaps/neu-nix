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
  swc,
  wld,
  lib,
}:

stdenv.mkDerivation {
  pname = "shko";
  version = "0.1.0";
  src = fetchFromCodeberg {
    owner = "chld";
    repo = "shko";
    rev = "4b895b42a22be7aa918fbc5f2cd01eb0424fc7cf";
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [ zig.hook ];

  # zigBuildFlags = [ "release ];
  dontSetZigDefaultFlags = true;

  buildInputs = [
  	libdrm
  	libinput
  	pixman
  	swc
  	wld
  	libudev0-shim
  	wayland
  	libxkbcommon
  	libxcb
  	libxcb-wm
  ];
}

