{ pkgs, lib, ... }:

{
  
  environment.systemPackages = with pkgs; [
    python3
    vscode
    git
    ];
}