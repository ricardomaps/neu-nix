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
  pname = "neuwm";
  version = "unstable-2026-03-20";
  src = fetchFromSourcehut {
    owner = "~pfr";
    repo = "neuwm";
    rev = "43caec8c9a7f7e6a6ef42a8619160cac9176f74e";
    hash = "sha256-6EI0iQKEElgoF0XrMst3X3jQxXY7yGWrwIJiLFuPv1Q=";
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
