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
    rev = "b3101d64e6f597e4c8d05e36e7918f6e9aa5cf30";
    hash = "sha256-jKR7gs53nTRhQxysGLUsfau3XeaNv0NBhcbT1N9sgLc=";
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
