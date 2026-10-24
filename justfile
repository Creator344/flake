alias r := rebuild
alias t := tidy
alias u := update
alias f := format

# `uname -n`, not `--nodename`: BSD uname on macOS has no long options.
hostname := `uname -n`

rebuild:
    {{ if hostname == "duckbook-pro" { "darwin-rebuild switch --flake .#" + hostname } else { "nixos-rebuild switch --flake .#" + hostname + " --sudo" } }}

tidy:
    nix-collect-garbage --delete-older-than 7d

update:
    nix flake update --option access-tokens "github.com=$(gh auth token)"
    just r

format:
    nix fmt
