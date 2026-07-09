{
  lib,
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  neuswc,
  wayland,
  pixman,
  libxkbcommon,
  libinput,
  libspng,
}:
stdenv.mkDerivation {
  pname = "howl";
  version = "0.1.0";
  src = fetchFromSourcehut {
    domain = "sr.ht";
    owner = "~wf";
    repo = "howl";
    rev = "52b7ba38135093b945079a93ee599c91f5e5e317";
    hash = "sha256-Lsv25r0nCNOEcYvq+62p/kIsAAM7MWr87yfNto+W6V0=;
  };

  nativeBuildInputs = [
    pkg-config
  ];
  buildInputs = [
    neuswc
    wayland
    pixman
    libxkbcommon
    libinput
    libspng
  ];

  preBuild = ''
    export NIX_LDFLAGS="$NIX_LDFLAGS $(pkg-config --libs wayland-server xkbcommon)"
  '';

  makeFlags = [ "PREFIX=$(out)" ];

  meta = {
    description = "A small Wayland compositor (howl) and its IPC client (howlc)";
    homepage = "https://srcdump.net/wf/howl/";
    license = lib.licenses.isc;
    mainProgram = "howl";
  };
}
