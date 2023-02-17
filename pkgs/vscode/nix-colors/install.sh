#!/bin/sh
vsce package --allow-missing-repository
code --install-extension nix-colors*.vsix