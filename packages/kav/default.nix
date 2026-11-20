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
    rev = "f15c861";
    hash = "sha256-CNrzs6paSHaLj7fBq6ad7kne0lqmgTroMmuQ3xOrdEo=";
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
    license = lib.licenses.unfree;
  };
}
