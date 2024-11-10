{pkgs, ...}: {
  home.packages = with pkgs; [
    ((google-chrome.override {
        commandLineArgs =
          ""
          + " --enable-zero-copy" # dont enable in about:flags
          + " --ignore-gpu-blocklist" # dont enable in about:flags
          + " --enable-raw-draw"
          + " --canvas-oop-rasterization"
          + " --simulate-outdated-no-au='Tue, 31 Dec 2099 23:59:59 GMT'"
          ############ disable Features
          + " --disable-features="
          + "UseChromeOSDirectVideoDecoder,"
          ############ enable Features
          + " --enable-features="
          + "VaapiVideoEncoder,"
          + "VaapiVideoDecoder,"
          + "CanvasOopRasterization,"
          + "Vulkan,"
          + " --use-vulkan";
      })
      .overrideAttrs {
        version = "125.0.6422.141";
        src = fetchurl {
          url = "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_125.0.6422.141-1_amd64.deb";
          hash = "sha256-nIdzl3DkvGy9EsNS8nvPi8yK0gvx9mFaxYSxuYZZzxI=";
        };
      })
  ];
}
