#!/bin/bash

delete_kubernetes_configs() {
  echo "Deleting Kubernetes configurations..."
  
  kubectl delete -f k3s/ingress.yaml
  kubectl delete -f k3s/service.yaml
  kubectl delete -f k3s/deployment.yaml
  kubectl delete -f k3s/pvc.yaml
  kubectl delete -f k3s/pv.yaml
  kubectl delete -f k3s/config_map.yaml
  
  
  if [ $? -ne 0 ]; then
    echo "Error: Failed to delete Kubernetes configurations."
    exit 1
  fi
  
  echo "Kubernetes configurations deleted successfully."
}

delete_kubernetes_configs
