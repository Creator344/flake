alias r := rebuild
alias t := tidy
alias u := update
alias f := format

host := `uname --nodename`

rebuild:
    sudo nixos-rebuild switch --flake ./#${host} --use-remote-sudo

tidy:
    nix-collect-garbage --delete-older-than 7d

update:
    nix flake update
    rebuild

format:
    treefmt
