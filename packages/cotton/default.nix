{
  stdenv,
  lib,
  meson,
  ninja,
  fetchgit
}:
stdenv.mkDerivation {
  pname = "cotton";
  version = "0.1";
  src = fetchgit {
    url = "https://srcdump.net/soggy/cotton.git";
    rev = "b36d00a";
    hash = "sha256-mTCC11wPFL09ecNEtrU8p3bc9bBSrCSE6yH7WAc+1Gs=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    meson
    ninja
  ];

  meta = {
    description = "Cotton is a tiny virtual computer that lives in your windows - it was written in C99 and has 64 KiB of memory and runs programs written in the cot programming language";
    license = lib.licenses.isc;
    homepage = "https://git.ouppyawa.xyz/0uppy/cotton/";
    mainProgram = "cotton";
  };
}
