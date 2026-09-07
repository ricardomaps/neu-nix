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
  pname = "klatka";
  version = "unstable-2026-04-25";
  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "klatka";
    rev = "e27ba5dfa8c51b403b900f2e08b9524ded041018";
    hash = "sha256-z2sd4cSByv5rCyL8nBjEP+M9+axJiB+81k2XCfE2cbs=";
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

  postPatch = ''
    substituteInPlace Makefile \
      --replace "-fcolor-diagnostics" ""
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp klatka $out/bin/klatka
    runHook postInstall
  '';

  meta = {
    description = "klatka is a kiosk-style compositor for neuswc it is basically gutted tohu";
    homepage = "https://git.sr.ht/~dlm/klatka";
    mainProgram = "klatka";
  };
}
