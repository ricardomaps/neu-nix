{
  lib,
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  pixman,
  wayland,
  neuswc,
  neuwld,
  libxcb,
  libxcb-wm,
  udev,
  libdrm,
  libinput,
  libxkbcommon,
  fontconfig,
}:
stdenv.mkDerivation {
  pname = "wsxwm";
  version = "unstable-2026-03-20";
  src = fetchFromSourcehut {
    owner = "~uint";
    repo = "wsxwm";
    rev = "f6a22e6d3c083cca5193e3f86154e2d654528ade";
    hash = "sha256-5ht8gt3hHq3CHQSNSBCm4TcNtDuFmajLvDnPUJGRJMk=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    pixman
    wayland
    neuswc
    neuwld
    libxcb
    libxcb-wm
    udev
    libdrm
    libinput
    libxkbcommon
    fontconfig
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp wsxwm $out/bin/wsxwm
    runHook postInstall
  '';

  meta = {
    description = "Way Sexier Window Manager";
    homepage = "https://git.sr.ht/~uint/wsxwm";
    license = lib.licenses.isc;
    mainProgram = "wsxwm";
  };
}
