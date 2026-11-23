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
    rev = "fe09c9e";
    hash = "sha256-pSoZ2ShUO2jl602hoak0rnWhpDorY0uknDFYyCNNnJA=";
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
