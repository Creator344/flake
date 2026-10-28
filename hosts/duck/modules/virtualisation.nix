_: {
  virtualisation.docker.enable = true;

  # Lets containers (and the CUDA workloads above) use the host GPU.
  hardware.nvidia-container-toolkit.enable = true;
}
