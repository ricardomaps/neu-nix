{
  lib,
  stdenv,
  fetchFromCodeberg,
  pkg-config,
  neuswc,
  wayland,
  pixman,
  libxkbcommon,
  libinput,
}:
stdenv.mkDerivation {
  pname = "howl";
  version = "0.1.0";
  src = fetchFromCodeberg {
    domain = "codeberg.org";
    owner = "wf";
    repo = "howl";
    rev = "b47b8ea4ea";
    hash = "sha256-F47JFIR1myzlu8UxZyZUx+PLUGYirQM1KfxiALCf13Y=";
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
  ];

  preBuild = ''
    export NIX_LDFLAGS="$NIX_LDFLAGS $(pkg-config --libs wayland-server xkbcommon)"
  '';

  makeFlags = [ "PREFIX=$(out)" ];

  meta = {
    description = "A small Wayland compositor (howl) and its IPC client (howlc)";
    homepage = "https://codeberg.org/wf/howl";
    license = lib.licenses.isc;
    mainProgram = "howl";
  };
}
