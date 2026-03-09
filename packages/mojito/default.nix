{
  lib,
  fetchFromSourcehut,
  stdenv,
  pixman,
  wayland,
  pkg-config,
  udev,
  libinput,
  libxcb,
  libxcb-wm,
  libxkbcommon,
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
    rev = "0b4307cb252b55e7f423c10882e6f5eba855d083";
    hash = "sha256-FQGjB4u1XIsbErcO2RlR6IU10wi6tlRecjS56gERWjs=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    pixman
    wayland
    udev
    libinput
    libxcb
    libxcb-wm
    libxkbcommon
    libdrm
    neuwld
    neuswc
    fontconfig
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
