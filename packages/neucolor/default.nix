{
  lib,
  buildGoModule,
  fetchFromSourcehut
}:
buildGoModule {
  pname = "neucolor";
  version = "0.0";
  src = fetchFromSourcehut {
    owner = "~pfr";
    repo = "neucolor";
    rev = "64a7a1b0297d442cd70a432a8231113e2e9d9c4e";
    hash = "sha256-nCzRxqPrMr0bhsXOsW7vsfVkPa5W6DpJfKc97d8846U=";
  };
  
  vendorHash = "sha256-LDZ/1Bu8ovvz2f2m/eNPOyPMnoTmWwnT0FiYOqrHYJ4=";

  meta = {
    description = "Wayland color picker for the neuswc compositor";
    license = lib.licenses.isc;
    homepage = "https://git.sr.ht/~pfr/neucolor";
  };
}
