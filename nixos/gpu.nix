{
  config,
  pkgs,
  ...
}: {
  # ---------------------------------------------------
  # INTEL
  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override {enableHybridCodec = true;};
  };
  hardware.graphics = {
    enable = true;

    extraPackages = with pkgs; [
      intel-vaapi-driver # LIBVA_DRIVER_NAME = "i965"
      libvdpau-va-gl
      intel-ocl
      intel-gmmlib
      vaapiVdpau
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      intel-vaapi-driver
    ];
  };

  environment.sessionVariables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    LIBVA_DRIVER_NAME = "i965";
    # LIBVA_DRI3_DISABLE = "1";
    # VDPAU_DRIVER = "va_gl";
  };

  # ---------------------------------------------------
  # NVIDIA
  nixpkgs.config.nvidia.acceptLicense = true;
  services.xserver.videoDrivers = ["nvidiaLegacy390"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:4:0:0";

      # sync.enable = true;
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
