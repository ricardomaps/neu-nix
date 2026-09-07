{
  stdenv,
  fetchFromSourcehut,
  lib,
}:
stdenv.mkDerivation {
  name = "neubar";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~pfr";
    repo = "neubar";
    rev = "5def1995181f983b34579a911bd05a0461493ca0";
    hash = "sha256-5rTX7xYG2DQtGyhNFfEaF/isUtubpoiRFlPVkWWBWYo=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "Event-driven status bar feeder for mojito";
    license = lib.licenses.isc;
    homepage = "https://git.sr.ht/~pfr/neubar";
  };
}

