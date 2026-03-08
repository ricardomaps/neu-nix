## neu-nix
A nix flake for neuswc and neuwld packages (shko, neumenu, hack, swall...).

### Installation
Add the flake as an input to your own system flake:
```nix
{
  inputs = {
    nixpkgs = "github:nixos/nixpkgs/nixos-unstable";

    neu-nix = {
      url = "github:ricardomaps/neu-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  }
  # ...
}
```

Then add all the packages you want, wherever your system uses them, eg.:
```nix
environment.systemPackages = with inputs.neu-nix.packages.${system}; [
  shko
  neumenu
  hack
];
```

Alternatively, you can use the flake's overlay:
```nix
  #...
  nixpkgs.overlays = [
    inputs.neu-nix.overlays.default
  ];

  environment.systemPackages = [
    shko
    neumenu
    swall
  ];
  #...
```

Take a look [here](https://wayland.fyi/) for information about the packages, what they are and how to use them.

### Contribute
Make a pull request with the package you want to contribute. Again, take a look [here](https://wayland.fyi/) for a list of packages that could be added here.
Familiarize yourself with the structure of the repo, write the package definition in the callPackage pattern and add it to packages/default.nix.
