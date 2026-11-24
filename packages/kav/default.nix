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
    rev = "770f648";
    hash = "sha256-cwgzRpO+S8klelggYW+/9p/efmrsCCL0fA5AcbD5vgs=";
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
