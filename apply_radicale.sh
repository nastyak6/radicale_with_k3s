#!/bin/bash

# Function to check if k3s is running
check_k3s() {
  if systemctl is-active --quiet k3s; then
    echo "K3s is running."
  else
    echo "Error: K3s is not running. Please ensure K3s is installed and running before applying Kubernetes configurations."
    exit 1
  fi
}

# Function to build and push Docker image
build_and_push_docker_image() {
  echo "Building Docker image..."
  
  # Build Docker image
  docker build -t nastyak6/radicale:latest .
  
  if [ $? -ne 0 ]; then
    echo "Error: Docker image build failed."
    exit 1
  fi
  
  echo "Pushing Docker image to registry..."
  
  # Push Docker image to registry
  docker push nastyak6/radicale:latest
  
  if [ $? -ne 0 ]; then
    echo "Error: Docker image push failed."
    exit 1
  fi
  
  echo "Docker image built and pushed successfully."
}

# Function to apply Kubernetes YAML files
apply_kubernetes_configs() {
  echo "Applying Kubernetes configurations..."
  alias k=kubectl
  kubectl apply -f k3s/config_map.yaml
  kubectl apply -f k3s/pv.yaml
  kubectl apply -f k3s/pvc.yaml
  kubectl apply -f k3s/deployment.yaml
  kubectl apply -f k3s/service.yaml
  kubectl apply -f k3s/ingress.yaml
  
  if [ $? -ne 0 ]; then
    echo "Error: Failed to apply Kubernetes configurations."
    exit 1
  fi
  
  echo "Kubernetes configurations applied successfully."
}

# Function to check if the Radicale pod is running
check_radicale_pod() {
  echo "Checking Radicale pod status..."
  
  kubectl get pods -l app=radicale
  
  if [ $? -ne 0 ]; then
    echo "Error: Failed to get Radicale pod status."
    exit 1
  fi
  
  echo "Checking Radicale pod details..."
  
  kubectl describe pod $(kubectl get pods -l app=radicale -o jsonpath="{.items[0].metadata.name}")
  
  if [ $? -ne 0 ]; then
    echo "Error: Failed to describe Radicale pod."
    exit 1
  fi
}

# Run the functions
check_k3s
build_and_push_docker_image
apply_kubernetes_configs
check_radicale_pod
