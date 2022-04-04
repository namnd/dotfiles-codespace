#!/bin/bash
set -e -o pipefail

dir=/workspaces/.codespaces/.persistedshare/dotfiles
username=$1

# Generate aws config
mkdir -p ~/.aws
cat $dir/aws.config |sed "s/username/$username/g" > ~/.aws/config
echo "Generated ~/.aws/.config"

# Setup aws vault
export AWS_VAULT_BACKEND=file
if ( ! $(aws-vault list --credentials |grep iam > /dev/null) ); then
  echo "- Your AWS credentials will be saved into a keychain vault."
  echo "- Once you've entered your credentials, you'll create a password."
  echo "- This password will be used for command-line sessions with MFA."
  aws-vault add iam
fi
