{pkgs, ...}: let
  myEmacs =
    (pkgs.emacsPackagesFor (pkgs.emacs29.override {
      withNativeCompilation = true;
      withTreeSitter = true;
      withGTK3 = true;
    }))
    .emacsWithPackages (epkgs: with epkgs; [vterm treesit-grammars.with-all-grammars]);
in {
  environment.systemPackages = with pkgs; [myEmacs];
  services = {
    emacs = {
      install = true;
      enable = true;
      startWithGraphical = true;
    };
  };
}
