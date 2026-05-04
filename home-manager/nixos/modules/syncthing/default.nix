{services.syncthing = {
  enable = true;
  settings = {
    devices = {
      "duckbook-pro" = {
        id = "FZ7VHHN-44BEWPF-J3RGNF5-FZWHBLL-URP44HN-OHVJQV5-TF2EIML-DJ54CAM";
      };
    };
    folders = {
      "mxrat-5fhnc" = {
        label = "Documents";
        path = "/home/noahj/Documents";
        devices = [ "duckbook-pro" ];
      };
      "jjvlc-rbkuk" = {
        label = "Prism Instances";
        path = "/drives/SSD_STORAGE/Prism\ Launcher/";
        devices = [ "duckbook-pro" ];
      };
    };
  };
};
}
