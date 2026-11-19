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
    rev = "f9465c3";
    hash = "sha256-4pCWIVAaWiqOKNR19vARlqtd46Xnzwlrtxuofb9x9iM=";
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
