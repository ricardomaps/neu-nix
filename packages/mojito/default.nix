{
  lib,
  fetchFromSourcehut,
  stdenv,
  pixman,
  wayland,
  wayland-scanner,
  pkg-config,
  libdrm,
  neuwld,
  neuswc,
  fontconfig,
}:
stdenv.mkDerivation {
  pname = "mojito";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "mojito";
    rev = "4c6b988e1927cff3bd6ffe22c552c31cd356dfca";
    hash = "sha256-8PKwCmJhLBuVXh47s+XzHeqy9w+YZhH1VtkuU1O7cfk=";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    pixman
    wayland
    libdrm
    neuwld
    neuswc
    fontconfig
    wayland
  ];

  makeFlags = [
    "PREFIX=$(out)"
    "DESTDIR=$(out)"
  ];

  meta = {
    description = "A featherweight, lime-scented (and somewhat alcoholic) bar for Wayland";
    homepage = "https://git.sr.ht/~dlm/mojito";
    license = lib.licenses.isc;
  };
}
