{
  stdenv,
  lib,
  SDL2,
  meson,
  ninja,
  pkg-config,
  fetchgit
}:
stdenv.mkDerivation {
  pname = "cotton";
  version = "v0.2.1";
  src = fetchgit {
    url = "https://git.ouppyawa.xyz/0uppy/cotton/";
    rev = "c6d7e652f9fc78c73e778807527c618ce57fe3a8";
    hash = "sha256-zNY3lHGXm2e+/W8P7Ty106RnEkZ9ZCGt6uP8GD7le8w=";
  };

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
  ];

  buildInputs = [
    SDL2
  ];

  patchPhase = ''
    substituteInPlace meson.build \
      --replace \
        "executable('cotton', src_files, dependencies : sdl2)" \
        "executable('cotton', src_files, dependencies : sdl2, install : true)"
  '';
  meta = {
    description = "Cotton is a tiny virtual computer that lives in your windows - it was written in C99 and has 64 KiB of memory and runs programs written in the cot programming language";
    license = lib.licenses.isc;
    homepage = "https://git.ouppyawa.xyz/0uppy/cotton/";
    mainProgram = "cotton";
  };
}
