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
  fzf \
  g++ \
  gcc \
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
  make \
  neovim \
	nmap \
	nmon \
	pasystray \
	pavucontrol \
	pipewire \
	powertop \
	python3-dev \
  python3-pip \
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

pip install --user powerline-status

sudo snap install bw

curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install nodejs
