{ pkgs, lib, ... }:

{
  
  environment.systemPackages = with pkgs; [
    slack
    ];
}