{
  stdenv,
  fetchFromSourcehut,
  lib,
  pkg-config,
  wld,
  wayland-protocols,
  fontconfig,
  libxkbcommon,
}:
stdenv.mkDerivation {
  pname = "neumenu";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~uint";
    repo = "neumenu";
    rev = "88d0bd8bb47a3bea4e806087b4be95af226d5bb3";
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland-protocols
    wld
    libxkbcommon
    fontconfig
  ];

  makeFlags = ["PREFIX=$(out)"];
}
