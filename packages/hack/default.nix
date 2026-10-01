{
  lib,
  writeText,
  fetchFromSourcehut,
  stdenv,
  clang,
  pkg-config,
  wayland-scanner,
  wayland,
  libdrm,
  libxkbcommon,
  pixman,
  fontconfig,
  freetype,
  plan9port-wayland,
  neuwld,
  openssl,
  conf ? null,
}:
stdenv.mkDerivation {
  pname = "hack";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "hack";
    rev = "011c9b1950310bbcc4a321f31f2452543785d3df";
    hash = "sha256-trWZCuH/57pleika7Wux9jsr8q3j/mD1Sk2g8SWQ7Do=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    clang
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
    libdrm
    libxkbcommon
    pixman
    fontconfig
    freetype
    plan9port-wayland
    neuwld
    openssl
  ];

  env.PLAN9 = "${plan9port-wayland}/plan9";

  postPatch =
    let
      configFile =
        if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.h" conf;
    in
    lib.optionalString (conf != null) "cp ${configFile} config.h";

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m 755 hack $out/bin/

    runHook postInstall
  '';
}
