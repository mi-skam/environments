{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/98747f27ecfee70c8c97b195cbb94df80a074dda.tar.gz") {} 
}:

pkgs.dockerTools.buildImage {
  name = "hello-docker";
  tag = "latest";
  created = "now";

  config = {
    Cmd = [ "${pkgs.hello}/bin/hello" ];
  };
}
