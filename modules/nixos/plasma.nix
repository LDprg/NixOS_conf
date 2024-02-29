{ inputs, outputs, self, user, host, lib, config, pkgs, ... }: {
  imports = [ ./xorg.nix ];

  environment.systemPackages = with pkgs; [
    kdePackages.plasma-thunderbolt
    kdePackages.filelight
    kdePackages.sddm-kcm
  ];

  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.sddm.wayland.enable = true;

  services.xserver.displayManager.sddm.settings = {
    Theme = {
      Current = "breeze";
      ThemeDir = "/sddmt";
    };
  };

  services.xserver.desktopManager.plasma6.enable = true;

  programs.xwayland.enable = true;
  programs.kdeconnect.enable = true;
}
