{
  stdenv,
  fetchFromCodeberg,
  lib,
  neuswc,
  neuwld,
  wayland,
  libxkbcommon,
  pixman,
  libxcb,
  libxcb-wm,
  libdrm,
  fontconfig,
  pkg-config,
  writeText,
  conf ? null
}:
stdenv.mkDerivation {
  pname = "mot";
  version = "0.0";
  src = fetchFromCodeberg {
    repo = "mot";
    owner = "chld";
    rev = "c5388ec50655d60d83cad5399c3bf3dcf2ac695b";
    hash = "sha256-SgVU4L8/aP0Tbi2MkwcozGVUHw8YRiAHmDx0tYQ55xc=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    neuswc
    neuwld
    wayland
    libdrm
    libxcb
    libxcb-wm
    libxkbcommon
    pixman
    fontconfig
  ];

  buildPhase = ''
    runHook preBuild

    cp config.def.h config.h

    $CC \
      -Wall -Wextra -Oz -g \
      $NIX_CFLAGS_COMPILE \
      $(pkg-config --cflags \
        swc wayland-server xkbcommon pixman-1 libdrm wld \
        xcb xcb-composite xcb-ewmh xcb-icccm) \
      -I. \
      -Isrc \
      -o mot \
      src/decor.c \
      src/tohu.c \
      src/util.c \
      src/hevel.c \
      $(pkg-config --libs \
        swc wayland-server xkbcommon pixman-1 libdrm wld \
        xcb xcb-composite xcb-ewmh xcb-icccm) \
      -lm

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -Dm755 mot $out/bin/mot

    runHook postInstall
  '';  

  postPatch =
    let
      configFile =
        if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.h" conf;
    in
    lib.optionalString (conf != null) "cp ${configFile} config.h";

  meta = {
    description = "Mouse oriented tohu - floating window manager for neuswc";
    mainProgram = "mot";
    license = lib.licenses.bsd0;
    homepage = "https://codeberg.org/chld/mot";
  };
}
