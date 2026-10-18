{
  lib,
  stdenv,
  fetchFromGitHub,
  pkg-config,
  wayland-scanner,
  wayland,
  fontconfig,
  pixman,
  swc,
  wld,
  libinput,
  libxkbcommon,
}:
stdenv.mkDerivation {
  name = "velox";
  version = "0-unstable-19-07-2026";
  src = fetchFromGitHub {
    owner = "michaelforney";
    repo = "velox";
    rev = "40b3f9c58edcc35efe3d37ffed50b067dbd431b8";
    hash = "sha256-MFJ4L+qPFglzVm4qJHK0bDGJcNohOUIIS7LyM0eCQS8=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    swc
    libxkbcommon
    libinput
    wld
    wayland
    fontconfig
    pixman
  ];
  
  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "Simple window manager based on swc";
    homepage = "https://github.com/michaelforney/velox";
    license = lib.licenses.mit;
  };
}
