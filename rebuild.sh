#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

echo "Staging ${SCRIPT_DIR}/settings.nix"
(cd ${SCRIPT_DIR}; git add -f settings.nix)

echo "Rebuilding Nixos config"
nixos-rebuild switch --flake ${SCRIPT_DIR}

echo "Unstaging settings.nix"
(cd ${SCRIPT_DIR}; git restore --staged settings.nix)