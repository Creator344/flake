alias r := rebuild
alias rlog := rebuild-logged
alias t := tidy
alias u := update
alias f := format

# `uname -n`, not `--nodename`: BSD uname on macOS has no long options.
hostname := `uname -n`

rebuild:
    {{ if hostname == "duckbook-pro" { "darwin-rebuild switch --flake .#" + hostname } else { "nixos-rebuild switch --flake .#" + hostname + " --sudo" } }}

# Same switch as `r`, but records the full output to /var/log/nixos-rebuild.log
# (rotated, keeps 10 runs) so a failed rebuild can be read afterwards.
rebuild-logged:
    sudo bash scripts/nixos-rebuild-logged.sh

tidy:
    nix-collect-garbage --delete-older-than 7d

update:
    nix flake update --option access-tokens "github.com=$(gh auth token)"
    just r

format:
    nix fmt
