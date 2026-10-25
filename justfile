alias r := rebuild
alias rlog := rebuild
alias t := tidy
alias u := update
alias f := format

# `uname -n`, not `--nodename`: BSD uname on macOS has no long options.
hostname := `uname -n`

# Every NixOS switch goes through the logging wrapper: nixos-rebuild's output
# never reaches the journal, so full output is recorded to
# /var/log/nixos-rebuild.log (rotated, keeps 10 runs) for post-hoc diagnosis.
rebuild:
    {{ if hostname == "duckbook-pro" { "darwin-rebuild switch --flake .#" + hostname } else { "sudo bash scripts/nixos-rebuild-logged.sh " + hostname } }}

tidy:
    nix-collect-garbage --delete-older-than 7d

update:
    nix flake update --option access-tokens "github.com=$(gh auth token)"
    just r

format:
    nix fmt
