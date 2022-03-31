#!/bin/bash

# Add repository for latest neovim
sudo add-apt-repository ppa:neovim-ppa/stable

 # Install tools
sudo apt install -y \
  jq \
  ripgrep \
  neovim \
  tmux \
  trash-cli

# Install neovim plugin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/share/fzf
~/.local/share/fzf/install --no-fish --no-zsh --key-bindings --completion --update-rc

# Install gopls (go language server protocol)
go install golang.org/x/tools/gopls@latest

source=/workspaces/.codespaces/.persistedshare/dotfiles
ln -s $source/tmux.conf $HOME/.tmux.conf
ln -s $source/nvim $HOME/.config/nvim
ln -s $source/gitconfig $HOME/.gitconfig
