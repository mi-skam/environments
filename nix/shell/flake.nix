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
          name = "dev-sh";
          buildInputs = with pkgs; [ 
            which
            htop
          ]; 
        };
      });
}
