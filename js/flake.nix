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
      let pkgs = nixpkgs.legacyPackages.${system};
       nixConfig.bash-prompt = "\[devShell\]$ ";
  
      in {
        devShell = pkgs.mkShell {
          name = "js-sh";
          nixConfig.bash-prompt = "\[dev\]$ ";
          buildInputs = with pkgs; [ nodejs-16_x ]; 
          shellHook = ''
            export PATH="/home/plumps/.npm-packages/bin:$PATH"
          '';

          NPM_CONFIG_PREFIX = "/home/plumps/.npm-packages";
        };
      });
}
