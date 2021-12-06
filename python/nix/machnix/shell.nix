{ pkgs ? import (fetchTarball https://git.io/Jf0cc) {} }:

let
  mach-nix = import (
    builtins.fetchGit {
      url = "https://github.com/DavHau/mach-nix/";
      ref = "refs/tags/3.3.0";
  }) {};

  customPython = mach-nix.mkPython {
    python = "python39";
    requirements = ''
      numpy
      pandas
      ipython
    '';
  };
in

pkgs.mkShell {
  buildInputs = [ customPython ];
}
