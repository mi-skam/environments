{
  
  nixConfig = {
    bash-prompt-suffix = "[dev]# ";
  };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: 
      let 
        pkgs = nixpkgs.legacyPackages.${system};
        python-packages-sh = pkgs.python3.withPackages (p: with p; [
          requests
          beautifulsoup4

          ipython
        ]);

      in {
        devShell = pkgs.mkShell {
          name = "python-sh";
          buildInputs = with pkgs; [ python-packages-sh ]; 
          shellHook = ''
            PYTHONPATH=${python-packages-sh}/${python-packages-sh.sitePackages}
          '';
        };
      });
}
