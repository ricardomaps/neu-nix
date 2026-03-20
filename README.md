## neu-nix
A nix flake for neuswc and neuwld packages (shko, neumenu, hack, swall...).

### Packages
The packages this flake currently provides are:

- `neuwld`
- `neuswc`
- `neumenu`
- `shko`
- `hevel`
- `swall`
- `hack`
- `swclock`
- `swiv`
- `mojito`
- `hst`
- `tohu`
- `neuwm`
- `wsxwm`

### Compositors
You can use the compositors in this flake in two ways. If you add neuswc to your system packages, you can launch them with swc-launch:
```sh
sudo swc-launch shko
```
Or, you can use a wrapper script that calls swc-launch for you, no need to add neuswc:
```sh
sudo shko-launch
```

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

### Configuring
Configuration can be done by overriding the package and passing in either a path to a config file, a derivation or just write the config inline.
For example to configure shko you can either do:

```nix
pkgs.shko.override {
  configZig = ''
    pub const terminal = "st-wl";
    pub const menu = "neumenu_run";
  '';
}
```

or:

```nix
pkgs.shko.override {
  configZig = ./path/to/config.zig;
}
```

Take a look at the default.nix file for the specific package you want to configure to see what argument is expected for the config.

### Contribute
Make a pull request with the package you want to contribute. Again, take a look [here](https://wayland.fyi/) for a list of packages that could be added here.
Familiarize yourself with the structure of the repo, write the package definition in the callPackage pattern and add it to packages/default.nix.
