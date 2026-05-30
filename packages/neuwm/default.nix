{
  lib,
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  meson,
  ninja,
  wayland,
  pixman,
  neuswc,
  neuwld,
  neuipc,
  libxcb,
  libxcb-wm,
  libdrm,
  libinput,
  udev,
  libxkbcommon,
  fontconfig,
  luajit,
}:
stdenv.mkDerivation {
  pname = "neuwm";
  version = "unstable-2026-03-20";
  src = fetchFromSourcehut {
    owner = "~pfr";
    repo = "neuwm";
    rev = "2ab821a8dbc3ff274915eff17fef8f19025ee53c";
    hash = "sha256-5tkq3TqOKlTncwIz43Hi+RheeJ2NigGS9E/OmR38qOU=";
  };

  nativeBuildInputs = [
    pkg-config
    meson
    ninja
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
    luajit
    neuipc
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp neuwm $out/bin/neuwm
    runHook postInstall
  '';

  meta = {
    description = "A wayland compositor based neuswc, forked from wsxwm and inspired by hevel";
    homepage = "https://git.sr.ht/~pfr/neuwm";
    license = lib.licenses.isc;
    mainProgram = "neuwm";
  };
}
