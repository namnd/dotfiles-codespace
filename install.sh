#!/bin/bash

# Add repository for latest neovim
sudo add-apt-repository ppa:neovim-ppa/stable

 # Install tools
sudo apt install -y \
  fzf \
  jq \
  ripgrep \
  neovim \
  tmux \
  trash-cli

# Install neovim plugin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install gopls (go language server protocol)
go install golang.org/x/tools/gopls@latest
