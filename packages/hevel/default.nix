{
  lib,
  writeText,
  stdenv,
  fetchFromSourcehut,
  neuwld,
  neuswc,
  libinput,
  pixman,
  pkg-config,
  fontconfig,
  wayland,
  wayland-scanner,
  wayland-protocols,
  libdrm,
  libxkbcommon,
  libxcb,
  libxcb-wm,
  udev,
  conf ? null,
}:
stdenv.mkDerivation {
  pname = "hevel";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "hevel";
    rev = "cce195a2176163f099ed95c9bf7020033bdbbac9";
    hash = "sha256-9B180ebZzOtv9eEICVpYSo558T0/UYEVELFztPzOX4o=";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    libdrm
    libinput
    pixman
    neuswc
    neuwld
    wayland
    wayland-protocols
    libxkbcommon
    libxcb
    libxcb-wm
    udev
    fontconfig
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  postPatch =
    let
      configFile =
        if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.h" conf;
    in
    lib.optionalString (conf != null) "cp ${configFile} config.h";

  meta = {
    description = "Scrollable, floating window manager for Wayland that uses mouse chords for all commands";
    homepage = "https://git.sr.ht/~dlm/hevel";
    license = lib.licenses.isc;
    mainProgram = "hevel";
  };
}
