#!/bin/sh
vsce package --allow-missing-repository
vscodium --install-extension nix-colors*.vsix