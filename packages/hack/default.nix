{
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

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m 755 hack $out/bin/

    runHook postInstall
  '';
}
