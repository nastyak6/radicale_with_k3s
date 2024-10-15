# Radicale with Kubernetes
![image](https://github.com/user-attachments/assets/195eb3d2-4b72-4bef-b3f1-41a635c4decd)


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

You will be prompted to log in. Use the username and password defined in the [/config/users](https://github.com/nastyak6/radicale_with_k8s/blob/main/config/users) file.
