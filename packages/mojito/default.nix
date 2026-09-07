{
  lib,
  fetchFromSourcehut,
  stdenv,
  pixman,
  wayland,
  wayland-scanner,
  wayland-protocols,
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
    rev = "5e6a307ec812ce6d7ecd66916cf4658afb19420e";
    hash = "sha256-wEggHpGKpR9oJvRVbyYeqjO683XaOL47czHGqPSoXKo=";
  };

  strictDeps = true;
  __structuredAttrs = true;

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
    # wayland-scanner
    wayland-protocols
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "A featherweight, lime-scented (and somewhat alcoholic) bar for Wayland";
    homepage = "https://git.sr.ht/~dlm/mojito";
    license = lib.licenses.isc;
  };
}
