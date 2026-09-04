{
  lib,
  stdenv,
  fetchgit,
  pkg-config,
  wayland,
  wayland-scanner,
  wayland-protocols
}:
stdenv.mkDerivation {
  pname = "wawa";
  version = "1.0";
  src = fetchgit {
    url = "https://srcdump.net/sewn/wawa.git";
    rev = "d6f85bf";
    hash = "sha256-7umrzeCJHmYvXz7OD64TCZQssZ8167oInwVuhzUJ+jg=";
  };

  env.NIX_CFLAGS_COMPILE = "-Wno-incompatible-pointer-types";
  
  nativeBuildInputs = [
    pkg-config
    wayland-scanner
    wayland-protocols
  ];

  buildInputs = [
    wayland
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

  

