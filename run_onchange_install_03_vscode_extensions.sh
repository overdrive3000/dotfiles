#!/bin/bash

extensions=(
	hashicorp.hcl
	hashicorp.terraform
	ms-azuretools.vscode-docker
	ms-vscode-remote.remote-containers
	task.vscode-task
	vscodevim.vim
)

for ext in ${extensions[@]}; do
	code --install-extension $ext
done
