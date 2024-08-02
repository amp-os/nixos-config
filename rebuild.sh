#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Staging ${SCRIPT_DIR}/settings.nix"
git add -f ${SCRIPT_DIR}/settings.nix

echo "Rebuilding Nixos config"
nixos-rebuild switch --flake ${SCRIPT_DIR}

echo "Unstaging settings.nix"
git restore --staged ${SCRIPT_DIR}/settings.nix