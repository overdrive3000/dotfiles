#!/bin/bash -x

# check if running Ubuntu
uname -a | grep 'Ubuntu' || exit 0

sudo apt update && sudo apt -y upgrade

sudo apt install -y \
	apt-transport-https \
  autojump \
	blueman \
	build-essential \
	ca-certificates \
	compton \
	compton-conf \
	curl \
	copyq \
	dnsutils \
	feh \
	firmware-misc-nonfree \
  fzf \
	git \
	gnupg \
	gparted \
	htop \
	i3 \
	i3lock-fancy \
	i7z \
	jq \
	kdiff3 \
	laptop-mode-tools \
	libcairo2-dev \
	libdbus-glib-1-dev \
	libnotify-bin \
	linux-cpupower \
  neovim \
	nmap \
	nmon \
	pasystray \
	pavucontrol \
	pipewire \
	powertop \
	python3-dev \
	python3-venv \
	python3-wheel \
	python3-xlib \
  ripgrep \
	rofi \
	shellcheck \
	solaar-gnome3 \
	tig \
  tmux \
	unrar \
	virtualenvwrapper \
  wget \
	xautolock \
	xbacklight \
	xsel \
	xserver-xorg-input-synaptics \
	yamllint \
	zim \
	zsh \
	zsh-autosuggestions \
	zsh-syntax-highlighting	

# bat - cat with wings
BAT_VERSION=0.15.4
BAT_DEB=~/Downloads/bat_${GIT_DELTA_VERSION}_amd64.deb
curl -s -C - -Lo $BAT_DEB https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/bat_${BAT_VERSION}_amd64.deb
sudo apt install $BAT_DEB

pip install --user powerline-status
