alias r := rebuild
alias t := tidy
alias u := update
alias f := format

hostname := `uname --nodename`

rebuild:
    sudo nixos-rebuild switch --flake ./#{{hostname}} --sudo

tidy:
    nix-collect-garbage --delete-older-than 7d

update:
    nix flake update
    just r

format:
    treefmt
