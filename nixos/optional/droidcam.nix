{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [v4l-utils droidcam];

  services.usbmuxd.enable = true;

  boot = {
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    kernelModules = ["v4l2loopback" "snd-aloop"];
  };
}
