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
    rev = "346ada49eaa2fb47d81822c567fc5f0876163f80";
    hash = "sha256-+sTAfX5UeWoLbvjcDIcg4PGMdv6lWPgWyoKPZhMYq24=";
  };

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

  PLAN9 = "${plan9port-wayland}/plan9";

  postPatch =
  let
    configFile =
      if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.h" conf;
  in
  lib.optionalString (conf != null)  "cp ${configFile} config.h";


  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m 755 hack $out/bin/

    runHook postInstall
  '';
}
