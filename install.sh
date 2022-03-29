#!/bin/bash

# Install nix
sh <(curl -L https://nixos.org/nix/install) --no-daemon
sleep 5
. /home/codespace/.nix-profile/etc/profile.d/nix.sh

# Install tools
nix-env -iA \
  nixpkgs.fzf \
  nixpkgs.jq \
  nixpkgs.go \
  nixpkgs.gopls \
  nixpkgs.nodejs \
  nixpkgs.ripgrep \
  nixpkgs.tailscale \
  nixpkgs.tmux \
  nixpkgs.trash-cli \
  nixpkgs.tree-sitter
