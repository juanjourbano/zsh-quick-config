#!/bin/bash

if [ $(whoami) != "root" ]; then
	echo "You must be root"
	exit 1
fi

apt update

# Install git if not installed and zsh
apt install git zsh -y

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Custom .zshrc file
rm $HOME/.zshrc
curl -fsSL https://raw.githubusercontent.com/juanjourbano/zsh-quick-config/main/.zshrc > $HOME/.zshrc

# Copying zsh-cp command
# This command will allow to rapidly configure zsh on a non-root user
curl -fsSL https://raw.githubusercontent.com/juanjourbano/zsh-quick-config/main/zsh-cp > /usr/local/bin/zsh-cp
chmod +x /usr/local/bin/zsh-cp
