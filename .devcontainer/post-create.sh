#!/bin/bash

echo "post-create start" >> ~/status

# this runs in background after UI is available

kind create cluster --config kind-cluster.yaml
echo 'source <(kubectl completion bash)' >> /home/vscode/.bashrc
echo 'alias k=kubectl' >> /home/vscode/.bashrc
echo 'complete -F __start_kubectl k' >> /home/vscode/.bashrc

echo "post-create complete" >> ~/status
