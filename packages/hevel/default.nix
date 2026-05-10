{
  lib,
  writeText,
  stdenv,
  fetchFromSourcehut,
  neuswc,
  pkg-config,
  wayland,
  libxkbcommon,
  conf ? null,
}:
stdenv.mkDerivation {
  pname = "hevel";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~dlm";
    repo = "hevel";
    rev = "7ef61a5c0d4012417443734919ac723635cd5464";
    hash = "sha256-ad4euUV+jJYG58aO9tfKyCq8sznDf2tHj7RmORqnP1o=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    neuswc
    wayland
    libxkbcommon
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  postPatch =
    let
      configFile =
        if lib.isDerivation conf || builtins.isPath conf then conf else writeText "config.h" conf;
    in
    lib.optionalString (conf != null) "cp ${configFile} config.h";

  meta = {
    description = "Scrollable, floating window manager for Wayland that uses mouse chords for all commands";
    homepage = "https://git.sr.ht/~dlm/hevel";
    license = lib.licenses.isc;
    mainProgram = "hevel";
  };
}
