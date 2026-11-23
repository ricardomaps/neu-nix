{
  stdenv,
  fetchgit,
  lib,
  re2c,
  makeWrapper,
  qbe,
  musl,
  pkgsMusl,
}:

stdenv.mkDerivation {
  pname = "kav";
  version = "0.0";
  src = fetchgit {
    url = "https://srcdump.net/shrub/kav.git";
    rev = "0ae9a6e";
    hash = "sha256-4yzCCNvnu+erzA4Lo99U/T/j/cRrYd1xXmIwiYAWk0o=";
  };

  __structuredAttrs = true;
  strictDeps = true;

  nativeBuildInputs = [
    re2c
    makeWrapper
  ];

  makeFlags = [
    "PREFIX=$(out)"
  ];

  postInstall = ''
    wrapProgram $out/bin/kav \
      --set-default KAVPATH $out/lib/kav \
      --prefix PATH : ${lib.makeBinPath [ qbe pkgsMusl.stdenv.cc ]} \
      --prefix LIBRARY_PATH : ${musl}/lib
  '';

  meta = {
    description = "A programming language!";
    homepage = "https://srcdump.net/shrub/kav";
    license = lib.licenses.unfree;
    mainProgram = "kav";
  };
}
