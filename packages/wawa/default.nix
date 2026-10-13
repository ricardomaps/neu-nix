{
  lib,
  stdenv,
  fetchFromCodeberg,
  pkg-config,
  wayland,
  wayland-scanner,
  wayland-protocols
}:
stdenv.mkDerivation {
  pname = "wawa";
  version = "1.0";
  src = fetchFromCodeberg {
    owner = "sewn";
    repo = "wawa";
    rev = "5446559073c42a8b7676d364e4e1638427e1492d";
    hash = "sha256-z0tvAP+VVFccsRpyynw4w/QYxqfFgnJwIpLZVzo9wP0=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  env.NIX_CFLAGS_COMPILE = "-Wno-incompatible-pointer-types";
  
  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    wayland
    wayland-scanner
    wayland-protocols
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "A simple, hackable, and distinctive Wayland wallpaper setter utilizing stb_image that targets wlr-layer-shell supported compositors, featuring tiling, spreading across monitors, along with fill, fit and stretching the wallpaper, with less SLOC than your average wallpaper setter.";
    homepage = "https://srcdump.net/sewn/wawa";
    license = lib.licenses.mit;
    mainProgram = "wawa";
  };
}

  

