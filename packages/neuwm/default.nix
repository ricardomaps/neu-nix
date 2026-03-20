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
    rev = "e03fb89bd19173784e643646c313cc41e85f3047";
    hash = "sha256-FkZac9BdFvMmNklsibl7VcZxrLKHTW7jWk7HzjtOlBQ=";
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
