#!/bin/bash

# check if running linux
uname -a | grep Linux || exit 0


# Install NERD Fonts
pushd /tmp
	git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
	./nerd-fonts/install.sh
popd

sudo rm -rf /tmp/nerd-fonts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
SPACESHIP_PROMPT_CHECKOUT=$ZSH_CUSTOM/themes/spaceship-prompt
SPACESHIP_PROMPT_REPO=https://github.com/denysdovhan/spaceship-prompt.git

echo Installing ZSH spaceship prompt...
if cd "$SPACESHIP_PROMPT_CHECKOUT"; then
    git pull
else 
    git clone $SPACESHIP_PROMPT_REPO "$SPACESHIP_PROMPT_CHECKOUT"
fi

ln -fs "$SPACESHIP_PROMPT_CHECKOUT/spaceship.zsh-theme" \
       "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sudo chsh -s $(command -v zsh) ${USER}
