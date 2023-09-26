{ inputs, outputs, self, user, host, lib, config, pkgs, ... }: {
  imports = [ ./xorg.nix ];
  
  config = lib.mkIf (config.specialisation != { }) {

    # Enable the KDE Plasma Desktop Environment.
    services.xserver.displayManager.sddm.enable = true;
    services.xserver.desktopManager.plasma5.enable = true;

    #services.xserver.displayManager.defaultSession = "plasmawayland";

    programs.kdeconnect.enable = true;
  };
}
