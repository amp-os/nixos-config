{ config, options, pkgs, lib, ... }:

{
  imports =
    [
    ];

  options = {

  };


  config = {
    environment.systemPackages = with pkgs; [
    ];

    services = {
      xserver.enable = true;
      xserver.displayManager.gdm.enable = false;
      xserver.desktopManager.gnome.enable = false;
      displayManager.sddm.enable = true;
      desktopManager.plasma6.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      kate
      kwrited
      elisa
    ];

  };
}