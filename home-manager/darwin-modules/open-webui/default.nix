{ lib, ... }:

{
  home.activation = {
    containers = lib.hm.dag.entryAfter [ "writeBoundry" ] ''
      run colima start \
      run docker compose -f ${./docker-compose.yml} -d
    '';
  };
}
