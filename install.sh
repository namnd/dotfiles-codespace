#!/bin/bash

# Install tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Add repository for latest neovim
sudo add-apt-repository ppa:neovim-ppa/stable

 # Install tools
sudo apt install -y \
  jq \
  ripgrep \
  neovim \
  postgresql \
  tmux \
  trash-cli

# Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp/
/tmp/aws/install -i ~/.local/share/aws-cli -b ~/.local/bin

# Install neovim plugin manager
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/share/fzf
~/.local/share/fzf/install --no-fish --no-zsh --key-bindings --completion --update-rc

# Install gopls (go language server protocol)
go install golang.org/x/tools/gopls@latest

# Install tfenv and terraform
git clone https://github.com/tfutils/tfenv.git ~/.local/share/tfenv
ln -s ~/.local/share/tfenv/bin/* ~/.local/bin
terraform_version='0.12.25'
tfenv install ${terraform_version}
tfenv use ${terraform_version}

source=/workspaces/.codespaces/.persistedshare/dotfiles
ln -s $source/tmux.conf $HOME/.tmux.conf
ln -s $source/nvim $HOME/.config/nvim
ln -s $source/gitconfig $HOME/.gitconfig
ln -s $source/aliases $HOME/.bash_aliases
