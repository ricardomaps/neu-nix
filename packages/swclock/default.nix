{
  stdenv,
  fetchFromSourcehut,
  pkg-config,
  wayland-scanner,
  wayland,
  wayland-protocols,
  neuwld,
  fontconfig,
  pixman,
}:
stdenv.mkDerivation {
  pname = "swclock";
  version = "0.0";

  src = fetchFromSourcehut {
    owner = "~shrub900";
    repo = "swclock";
    rev = "6b235cc8034b4da78cd322c382aee9d870175d81";
    hash = "sha256-/KKQxzC7Wp6CFjBz37trBrYh9kew5bN8JjdBD8+Hbec=";
  };

  nativeBuildInputs = [
    pkg-config
    wayland-scanner
  ];

  buildInputs = [
    wayland
    wayland-protocols
    neuwld
    fontconfig
    pixman
  ];

  makeFlags = [
    "XDG_SHELL_XML=${wayland-protocols}/share/wayland-protocols/stable/xdg-shell/xdg-shell.xml"
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin/
    install -m 755 swclock $out/bin/

    runHook postInstall
  '';

  meta = {
    description = "xclock-like analog clock program for wayland, using neuwld";
    homePage = "https://git.sr.ht/~shrub900/swclock";
    mainProgram = "swclock";
  };
}
