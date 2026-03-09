{
  lib,
  fetchFromSourcehut,
  stdenv,
  pkg-config,
  wayland-scanner,
  wayland,
}:
stdenv.mkDerivation {
  pname = "swall";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~uint";
    repo = "swall";
    rev = "fed1981e7f739a38193f9b3b32398ca75d2e7d29";
    hash = "sha256-mdOTTTA/mwP/GNbiEWiX0QMZEiseLAMuecUFwMyqOsw=";
  };

  postPatch = ''
    substituteInPlace Makefile \
      --replace "-fcolor-diagnostics" ""
  '';

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -m755 swall $out/bin/

    runHook postInstall
  '';

  meta = {
    description = "Wallpaper setter for neuswc";
    homepage = "https://git.sr.ht/~uint/swall";
    license = lib.licenses.isc;
    mainProgram = "swall";
  };
}
