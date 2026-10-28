# Read-only log access for the hermes agent on ai-vps (Argo).
#
# The agent needs to see *why* a rebuild failed, never to change anything on
# this box. So: one system user, no sudo, no write access, journal read via the
# systemd-journal group, and a single key pinned to `restrict` (no pty, no
# agent/port/X11 forwarding, no user rc) so it can only run non-interactive
# read commands.
{ pkgs, ... }:
{
  users.groups.argo-logs = { };

  users.users.argo-logs = {
    description = "Read-only log access for the hermes agent (Argo)";
    isSystemUser = true;
    group = "argo-logs";
    extraGroups = [ "systemd-journal" ];
    # sshd runs remote commands through the user's shell, so it must be a real
    # one; `restrict` in authorized_keys is what blocks interactive sessions.
    shell = pkgs.bashInteractive;
    home = "/var/lib/argo-logs";
    createHome = true;
    openssh.authorizedKeys.keys = [
      "restrict ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFHOR4Bo5qHhpo7Q8GIjld8SisUluOqIhCe+4vB146SB argo@vps-8a1c0766"
    ];
  };

  # Full rebuild output, written by `just rlog` (scripts/nixos-rebuild-logged.sh).
  # Group-readable so argo-logs can read it without sudo.
  systemd.tmpfiles.rules = [
    "f /var/log/nixos-rebuild.log 0640 root argo-logs -"
  ];
}
