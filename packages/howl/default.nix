{
  lib,
  stdenv,
  fetchFromGitea,
  pkg-config,
  neuswc,
  wayland,
  pixman,
  libxkbcommon,
  libinput,
}:
stdenv.mkDerivation {
   pname = "howl";
   version = "";
   src = fetchFromGitea {
     domain = "codeberg.org";
     owner = "wf";
     repo = "howl";
     rev = "";
     hash = "";
  };
 
   nativeBuildInputs = [
     pkg-config
   ];
   buildInputs = [
    neuswc
    wayland
    pixman
    libxkbcommon
    libinput
   ];
 
 preBuild = ''
    export NIX_LDFLAGS="$NIX_LDFLAGS $(pkg-config --libs wayland-server xkbcommon)"
 '';
 
 makeFlags = [ "PREFIX=$(out)" ];
 
 meta = {
   description = "A small Wayland compositor (howl) and its IPC client (howlc)";
   homepage = "https://codeberg.org/wf/howl";
   license = lib.licenses.isc;
   mainProgram = "howl"; 
 };
}
