#!/bin/bash

# Update everything first
sudo apt update && sudo apt upgrade -y

# Essential tools
sudo apt install curl vim build-essential git software-properties-common -y

# Get the latest Neovim (needed for kickstart.nvim to actually work)
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim -y

# Setup Neovim config
# Cleaning up old config if it exists
if [ -d "$HOME/.config/nvim" ]; then
    rm -rf ~/.config/nvim.bak
    mv ~/.config/nvim ~/.config/nvim.bak
fi

# Using my personal kickstart fork
git clone git@github.com:urbanspr1nter/kickstart.nvim.git ~/.config/nvim

# LaTeX setup for notes (this is huge, like 5GB+)
echo "Installing LaTeX... this is gonna take a while."
sudo apt install texlive-full -y

# PDF viewer for the compiled docs
sudo apt install zathura zathura-pdf-poppler -y

echo "Done. Ready to code."
