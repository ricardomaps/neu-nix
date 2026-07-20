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
    rev = "7822b8299c929bcedfeb1d5385f9fe858e16f7b9";
    hash = "sha256-ywPb7yKBQUD5TufNuJUdGyH+tUtNjB8809GKZsSKiWM=";
  };

  makeFlags = [
    "PREFIX=$(out)"
  ];

  meta = {
    description = "Event-driven status bar feeder for mojito";
    license = lib.licenses.isc;
    homepage = "https://git.sr.ht/~pfr/neubar";
  };
}

