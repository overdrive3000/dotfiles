#!/bin/bash

NVIM_PATH=/usr/bin/nvim

# Make neovim default editor
set -u
sudo update-alternatives --install /usr/bin/ex ex "${NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${NVIM_PATH}" 110

# install spacevim
curl -sLf https://spacevim.org/install.sh | bash
