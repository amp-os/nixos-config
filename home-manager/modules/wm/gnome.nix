{ config, pkgs, lib, systemSettings, ... }:

{
  home-manager.users.gdm = { lib, ... }: {
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        scaling-factor = lib.hm.gvariant.mkUint32 1.25;
      };
    };
  };
}
