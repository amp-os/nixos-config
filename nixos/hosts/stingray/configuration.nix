{ config, pkgs, lib, systemSettings, lanzaboote, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/secureboot.nix
      ../../modules/work.nix
      ../../modules/plasma.nix
    ];

  networking.hostName = "stingray"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "euro";
  };

  # Install firefox.
  programs.firefox.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vscode
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
