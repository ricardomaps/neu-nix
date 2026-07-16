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
    rev = "91c59d430f0359c44a3a0413cc72ec5d769cd86c";
    hash = "sha256-nxoo/+3AaIVvDESYL1JDJflU/uXitFl84zj5CsCjhvk=";
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
