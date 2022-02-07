#!/bin/bash

sudo apt update

# Install zsh
sudo apt install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Enable plugins git, zsh-autosuggestions and dirhistory
cat .zshrc | grep -v "plugins=(git)" > .zshrc
echo "plugins=(git,zsh-autosuggestions,dirhistory)" >> .zshrc

# Enable jonathan theme
cat .zshrc | grep -v 'ZSH_THEME="robbyrussel"' > .zshrc
echo 'ZSH_THEME="jonathan"' >> .zshrc
