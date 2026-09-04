{
  lib,
  stdenv,
  fetchgit,
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
  src = fetchgit {
    url = "https://srcdump.net/wf/howl.git";
    rev = "52b7ba3";
    hash = "sha256-Lsv25r0nCNOEcYvq+62p/kIsAAM7MWr87yfNto+W6V0=";
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
    description = "Small Wayland compositor (howl) and its IPC client (howlc)";
    homepage = "https://srcdump.net/wf/howl/";
    license = lib.licenses.isc;
    mainProgram = "howl";
  };
}
