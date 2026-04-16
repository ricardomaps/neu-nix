{
  lib,
  meson,
  ninja,
  stdenv,
  fetchFromCodeberg,
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
  pname = "slgro";
  version = "1.2";
  src = fetchFromCodeberg {
    owner = "0uppy";
    repo = "slgro";
    rev = "2576651c3954e2a32492a0984894b6485cbfff3a";
    hash = "sha256-eA6+ZH5GFBockYWW0FSi/F/SIkhCzdjofQ1W5+yLBQM=";
  };

  nativeBuildInputs = [
    meson
    ninja
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

  postPatch = ''
    sed -i "/install_data('source\/config.lua'/,/)/d" meson.build
  '';

  meta = {
    description = "slgro is a floating (with keyboard-driven window movement, resizing and added centering and snapping) window manager for swc configurable using lua";
    homepage = "https://codeberg.org/0uppy/slgro";
    license = lib.licenses.isc;
    mainProgram = "slgro";
  };
}
