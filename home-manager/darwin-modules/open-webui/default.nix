{ lib, pkgs, ... }:

{
  home.activation = {
    containers = lib.hm.dag.entryAfter [ "writeBoundry" ] ''
      #!/bin/zsh
      run ${pkgs.docker}/bin/docker context use colima
      run ${pkgs.colima}/bin/colima start
      run cd ${./.}
      run ${pkgs.docker}/bin/docker compose -f ${./docker-compose.yml} up -d
      run cd ${./searxng-docker}
      run ${pkgs.docker}/bin/docker compose -f ${./searxng-docker/docker-compose.yml} up -d
      run cd ~
    '';
  };
}
