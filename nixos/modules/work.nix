{ pkgs, lib, ... }:

{
  imports =
    [
      ./programming.nix
    ];


  environment.systemPackages = with pkgs; [
    slack
    dropbox
    ];
}