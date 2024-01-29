# Argo CD v2.10 Examples

## Bootstrapping Argo CD
```
kind create cluster --config kind-cluster.yaml
kubectl apply -k argocd
kubectl apply -f apps.yaml
```

This example includes a `devcontainer` configuration, allowing you to automatically create an environment for testing using the VSCode Dev Containers extension or GitHub Codespaces.

## Accessing the UI
Navigate to [https://localhost:8080/](https://localhost:8080/) on the machine with the `kind` cluster running.

Get the generated `admin` password.
```
argocd admin initial-password -n argocd
```

## Clean Up
```
kind delete cluster --name argocd-v2-10-examples
```

## Examples
