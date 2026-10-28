{
  # Binary caches: CUDA closures are huge, and zed ships its own cache.
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    extra-substituters = [
      "https://cache.nixos-cuda.org"
      "https://zed.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
    ];
  };

  # Steam, CUDA, blender-bin and the NVIDIA driver all need this.
  nixpkgs.config.allowUnfree = true;
}
