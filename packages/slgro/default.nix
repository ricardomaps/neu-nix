{
  lib,
  meson,
  ninja,
  stdenv,
  fetchgit,
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
  version = "1.4";
  src = fetchgit {
    url = "https://git.ouppyawa.xyz/0uppy/slgro";
    rev = "a4adaa665622ae858a9696d684db4b7c1379f9c8";
    hash = "sha256-9jHNOPGzhqFJcxE/bhsfGIFhKSCQFgJT9x0m19Ff1qY=";
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
    homepage = "https://git.ouppyawa.xyz/0uppy/slgro";
    license = lib.licenses.isc;
    mainProgram = "slgro";
  };
}
