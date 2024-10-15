# Radicale with Kubernetes

This repository demonstrates how to deploy the Radicale calendar server in a Kubernetes cluster.

## Accessing Locally

To access the Radicale service locally, use the following command in your terminal:

```bash
kubectl port-forward svc/radicale-service 5232:80
```

Then, open your web browser and navigate to:
```bash
http://localhost:5232/.web/
```

You will be prompted to log in. Use the username and password defined in the /config/users file.
