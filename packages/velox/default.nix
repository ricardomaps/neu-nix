{
  stdenv,
  fetchFromGitHub,
  wayland-scanner,
  wayland,
  pixman,
  pkg-config,
}:
stdenv.mkDerivation {
  name = "velox";
  version = "0-unstable-19-07-2026";
  src = fetchFromGitHub {
    owner = "michaelforney";
    repo = "velox";
    rev = "40b3f9c58edcc35efe3d37ffed50b067dbd431b8";
    hash = "sha256-MFJ4L+qPFglzVm4qJHK0bDGJcNohOUIIS7LyM0eCQS8=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
    pixman
  ];
  
  makeFlags = [
    "PREFIX=$(out)"
  ];
}
