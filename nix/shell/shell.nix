{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/98747f27ecfee70c8c97b195cbb94df80a074dda.tar.gz") {} 
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
   which
   htop
   zlib ];

   shellHook = ''
    echo Hello "$MY_ENV_VAR"
   '';

   MY_ENV_VAR = "world.";
}

