{
  lib,
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
  ninja
}:
stdenv.mkDerivation {
  pname = "tohu";
  version = "0.0";
  src = fetchgit {
    url = "https://srcdump.net/shrub/tohu.git";
    rev = "4e18c2f";
    hash = "sha256-3iLuL0aD7p/X4Qy/M7aKb44oR2cuO7iWOvCP6XOklXo=";
  };

  nativeBuildInputs = [
    pkg-config
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
  ];

  preInstall = "export PREFIX=$out";

  # screw shrub we dynamic link
  patchPhase = ''
    substituteInPlace build.ninja \
      --replace-fail \
        'pkg-config --static --libs' \
        'pkg-config --libs'
  '';

  meta = {
    description = "floating window manager for swc";
    homepage = "https://srcdump.net/shrub/tohu";
    license = lib.licenses.isc;
    mainProgram = "tohu";
  };
}
