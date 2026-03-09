{
  lib,
  fetchFromSourcehut,
  stdenv,
  pkg-config,
  wayland,
  wayland-scanner,
  wayland-protocols,
  neuwld,
  fontconfig,
  pixman,
  libxkbcommon,
  libdrm,
  patches ? [],
}:
stdenv.mkDerivation {
  pname = "hst";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "hst";
    rev = "6187ef823d1fabe2139aed54dbb7a7e28c6d8ff4";
    hash = "sha256-9BOPmt7Yjz0YfOfK6tOhqKg0l+so3xsXoeSG+5qUF0g=";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
    wayland-protocols
    neuwld
    fontconfig
    pixman
    libxkbcommon
    libdrm
  ];

  makeFlags = [
    "PREFIX=$(out)"
    "DESTDIR="
  ];

  inherit patches;

  # I'm not sure what goes wrong here, may look into it later
  postPatch = ''
    substituteInPlace Makefile \
      --replace-fail "tic -sx st-wl.info" ""
  '';

  meta = {
    description = "Fork of st-wl using neuwld";
    homepage = "https://git.sr.ht/~dlm/hst";
    license = lib.licenses.mit;
    mainProgram = "st-wl";
  };
}
