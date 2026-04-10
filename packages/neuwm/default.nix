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
  luajit,
}:
stdenv.mkDerivation {
  pname = "neuwm";
  version = "unstable-2026-03-20";
  src = fetchFromSourcehut {
    owner = "~pfr";
    repo = "neuwm";
    rev = "e8a37b2a0072542bb9c9d8332f4f087050f59ca0";
    hash = "sha256-lyTvTq/sJ0d4459SwRCDtdPeBz1o7mBbpSAn7Pyf4ow=";
  };

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
    luajit
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
    license = lib.licenses.unlicense;
    mainProgram = "neuwm";
  };
}
