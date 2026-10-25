#!/bin/bash
set -Eeuo pipefail

exec > >(tee -a /var/log/mlops-bootstrap.log) 2>&1

echo "Starting MLOps EC2 bootstrap..."

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  unzip \
  git \
  jq \
  vim \
  python3 \
  python3-pip \
  python3-venv \
  docker.io

# Start Docker and enable it after reboot.
systemctl enable --now docker

# Allow the default Ubuntu user to run Docker commands.
usermod -aG docker ubuntu

# Install AWS CLI v2 for x86_64.
curl -fsSL \
  "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
  -o /tmp/awscliv2.zip

unzip -q /tmp/awscliv2.zip -d /tmp
/tmp/aws/install
rm -rf /tmp/aws /tmp/awscliv2.zip

# Install kubectl using the current stable Kubernetes release.
KUBECTL_VERSION="$(curl -fsSL \
  https://dl.k8s.io/release/stable.txt)"

curl -fsSLo /tmp/kubectl \
  "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"

install -o root -g root -m 0755 /tmp/kubectl /usr/local/bin/kubectl
rm -f /tmp/kubectl

# Install Kind.
curl -fsSLo /usr/local/bin/kind \
  https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64

chmod 0755 /usr/local/bin/kind

# Install Helm 3.
curl -fsSL \
  https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
  -o /tmp/get_helm.sh

bash /tmp/get_helm.sh
rm -f /tmp/get_helm.sh

# Verify core installations.
docker --version
aws --version
kubectl version --client
kind version
helm version
python3 --version
git --version

echo "MLOps EC2 bootstrap completed."
