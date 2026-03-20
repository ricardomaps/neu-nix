{
  mkShell,
  nixfmt,
  nixd,
}:
mkShell {
  buildInputs = [
    nixfmt
    nixd
  ];
}
