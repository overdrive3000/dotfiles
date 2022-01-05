#!/bin/bash

#DESTINATION_DIRECTORY=~/.bin

# Install AWSCLI
pushd /tmp || exit
	curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
	unzip awscliv2.zip
	sudo ./aws/install
	rm -rf ./aws
popd || exit

# Install arkade
curl -sLS https://get.arkade.dev | sudo sh

for executable in \
	kubectl \
	kustomize \
	helm \
	terraform \
	krew \
	; do
	if ! [ -x "$(command -v $executable)" ] ; then
		arkade get $executable
	fi
done

# Install Go
pushd /tmp || exit
	curl "https://dl.google.com/go/$(curl https://golang.org/VERSION?m=text).linux-amd64.tar.gz" -o go.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
popd || exit

# Install VS Code
pushd /tmp || exit
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code
popd || exit
