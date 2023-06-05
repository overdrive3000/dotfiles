#!/bin/bash

#DESTINATION_DIRECTORY=~/.bin

# check if running linux
uname -a | grep Linux || exit 0

export GOVERSION="1.20.4"

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
	curl "https://dl.google.com/go/go${GOVERSION}.linux-amd64.tar.gz" -o go.tar.gz
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

# Install CDK
sudo npm install -g aws-cdk@latest

# Install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

sudo usermod -aG docker ${USER}

# Install krew kubectl package manager
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

