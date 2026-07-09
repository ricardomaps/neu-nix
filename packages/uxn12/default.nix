{
  stdenv,
  fetchgit,
  lib,
  wayland,
  libxkbcommon,
}:
stdenv.mkDerivation {
  name = "uxn12";
  version = "0-unstable-2026-07-09";
  src = fetchgit {
    url = "https://srcdump.net/pita/uxn12.git";
    rev = "f2da2dc6c6728680f2aeef161bf69faa6efbaf49";
    hash = "sha256-jKZS9d3+4388TbkNQjsJYofXYRpCxj/WqlM/4t4/gR0=";
  };

  strictDeps = true;

  doCheck = false;

  buildInputs = [
    wayland
    libxkbcommon
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  checkPhase = ''
    export XDG_RUNTIME_DIR=$TMPDIR
    export HOME=$TMPDIR
    make test
  '';

  meta = {
    description = "Port of uxn11 to wayland";
    mainProgram = "uxn12";
    homepage = "https://srcdump.net/pita/uxn12/index.html";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux;
  };
}

