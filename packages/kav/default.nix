{
  stdenv,
  fetchgit,
  lib,
  re2c,
}:
stdenv.mkDerivation {
  pname = "kav";
  version = "0.0";
  src = fetchgit {
    url = "https://srcdump.net/shrub/kav.git";
    rev = "ad70a2ba9ec72b28c39c9e22f53efbdad4f0796e";
    hash = "sha256-V25ntceaRKNW2IY4IIgHb5R/BQ/+DfDdZAhMC7iUu2o=";
  };

  nativeBuildInputs = [
    re2c
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp kav $out/bin

    runHook postIntall
  '';

  meta = {
    description = "A programming language!";
    homepage = "https://srcdump.net/shrub/kav";
    license = lib.licenses.mit;
  };
}
