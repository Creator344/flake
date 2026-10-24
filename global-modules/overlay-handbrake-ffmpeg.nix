# Temporary workaround for https://github.com/NixOS/nixpkgs/issues/576333
#
# HandBrake 1.11.2 carries a bundle of ffmpeg patches written against
# ffmpeg 8.1.2.  ffmpeg 8.1.3 moved pgssubdec.c and HandBrake's
# A15-lavc-pgssubdec-Add-graphic-plane-and-cropping.patch no longer applies
# ("Hunk #13 FAILED at 616"), which breaks the whole `handbrake` build and
# therefore any rebuild of duck.
#
# Upstream fix is https://github.com/NixOS/nixpkgs/pull/576407 (HandBrake
# itself dropped that patch when moving to ffmpeg 9).  Once it is in
# nixos-unstable: delete this file and its import in global-modules/nixos.nix.
#
# The patched ffmpeg is built *inside* handbrake's package.nix via
# `ffmpeg_8-full.overrideAttrs`, so handing handbrake a different ffmpeg would
# not help.  Instead, wrap the ffmpeg we pass so that any overrideAttrs chain
# starting from it has the A15 patch filtered out of the final patch list.
_final: prev:
let
  inherit (prev) lib;
  dropPgsPatch =
    drv:
    drv
    // {
      overrideAttrs =
        f:
        drv.overrideAttrs (
          old:
          let
            next = f old;
          in
          next
          // {
            patches = lib.filter (p: !(lib.hasInfix "A15-lavc-pgssubdec" (toString p))) (next.patches or [ ]);
          }
        );
    };
in
{
  handbrake = prev.handbrake.override {
    ffmpeg_8-full = dropPgsPatch prev.ffmpeg_8-full;
  };
}
