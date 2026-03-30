{
  lib,
  writeText,
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
  ncurses,
  patches ? [ ],
  extraLibs ? [ ],
  conf ? null,
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

  outputs = [
    "out"
    "terminfo"
  ];

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
    ncurses
  ];

  buildInputs = [
    wayland
    wayland-protocols
    neuwld
    fontconfig
    pixman
    libxkbcommon
    libdrm
  ]
  ++ extraLibs;

  makeFlags = [
    "PREFIX=$(out)"
    "DESTDIR="
  ];

  inherit patches;

  # taken straight from the st nixpkgs package
  preInstall = ''
    export TERMINFO=$terminfo/share/terminfo
    mkdir -p $TERMINFO $out/nix-support
    echo "$terminfo" >> $out/nix-support/propagated-user-env-packages
  '';

  postPatch =
    let
      configFile =
        if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.h" conf;
    in
    lib.optionalString (conf != null) "cp ${configFile} config.h";

  meta = {
    description = "Fork of st-wl using neuwld";
    homepage = "https://git.sr.ht/~dlm/hst";
    license = lib.licenses.mit;
    mainProgram = "st-wl";
  };
}
