{
  lib,
  stdenv,
  fetchFromGitHub,
  wayland,
  wayland-scanner,
  wayland-protocols,
  pkg-config,
  libdrm,
  wld,
  libxkbcommon,
  pixman,
  libxcb,
  libxcb-wm,
  libinput,
  udev,
  fontconfig,
}:
stdenv.mkDerivation {
  pname = "swc";
  version = "0.0";
  src = fetchFromGitHub {
    owner = "michaelforney";
    repo = "swc";
    rev = "e4ce1677c1c40af905253a81f025773822f567ea";
    hash = "sha256-/yj6J+TR4dJSi1lIu8YF4dg2gQ1oRkvYRgOmTfEoVio=";
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
    wld
    pixman
    libdrm
    libinput
    udev
    wayland
    libxcb
    libxcb-wm
    libxkbcommon
    fontconfig
    wayland-protocols
  ];

  postPatch = ''
    substituteInPlace launch/local.mk --replace-fail "4755" "755"
  '';

  meta = {
    description = "Library for making a simple Wayland compositor";
    homepage = "https://github.com/michaelforney/swc";
    license = lib.licenses.mit;
  };
}
  
