{
  lib,
  stdenv,
  fetchFromCodeberg,
  meson,
  ninja,
  pkg-config
}:
stdenv.mkDerivation {
  pname = "neuipc";
  version = "0.1.0";
  src = fetchFromCodeberg {
    owner = "binkd";
    repo = "neuipc";
    rev = "d654f2fa0013237f1681fd1d8c6653a38c3cc753";
    hash = "sha256-o/NzeqZEe7NTkiqv1blKTC42xoLrp8qyTF1g5sIy/ok=";
  };

  strictDeps = true;
  __structuredAttrs = true;


  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];
}
