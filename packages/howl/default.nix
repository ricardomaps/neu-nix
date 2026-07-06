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
    rev = "90e1c42e47ce3764a2d8f3fcda95e9066bba334e";
    hash = "sha256-oGyyspG5iumwNsnAA3WNTlfr8ocl8vW8K4CVYLhqYws=";
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
