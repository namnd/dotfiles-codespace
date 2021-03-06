#!/bin/bash

# Add repository for latest neovim
sudo add-apt-repository ppa:neovim-ppa/stable

 # Install tools
sudo apt install -y \
  dnsutils \
  jq \
  kitty \
  iputils-ping \
  neovim \
  postgresql \
  ripgrep \
  tmux \
  trash-cli

# Install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp/
/tmp/aws/install -i ~/.local/share/aws-cli -b ~/.local/bin

# Install aws-vault
curl -L https://github.com/99designs/aws-vault/releases/latest/download/aws-vault-linux-$(dpkg --print-architecture) -o ~/.local/bin/aws-vault
chmod 755 ~/.local/bin/aws-vault

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

# Install terraform-ls
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform-ls -y

# Symlinks
source=/workspaces/.codespaces/.persistedshare/dotfiles
ln -s $source/tmux.conf $HOME/.tmux.conf
ln -s $source/nvim $HOME/.config/nvim
ln -s $source/gitconfig $HOME/.gitconfig
ln -s $source/aliases $HOME/.bash_aliases

# Override bash config
echo 'shopt -s autocd' >> $HOME/.bashrc
echo 'HISTSIZE=10000' >> $HOME/.bashrc
echo 'HISTFILESIZE=20000' >> $HOME/.bashrc
echo 'export AWS_VAULT_BACKEND=file' >> $HOME/.bashrc
echo 'export PS1="${AWS_VAULT}$PS1"' >> $HOME/.bashrc

# Move aws vault setup file
mv $source/setup_aws_vault.sh $HOME/
