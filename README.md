# Argo CD v2.10
> Over 52 new features, 75 bug fixes, and 44 documentation updates with a total of 230 contributors!

https://blog.argoproj.io/argo-cd-v2-10-release-candidate-f69ba7bf9e06

## Examples

In order of my favourites:
### [ApplicationSet Template Patch](./examples/applicationset-template-patch/)
### [Server-Side Diff](./examples/server-side-diff/)
### [PostDelete Hook Support](./examples/postdelete-hook/)
### [Application Controller Sync Jitter](./examples/application-controller-sync-jitter/)
### [Kustomize Components Support](./examples/application-kustomize-components/)
### [Apps in Any Namespace & Notifications](./examples/notifications-in-any-namespace/)
### [Status Panel Extensions](./examples/status-panel-extensions/)

## Try it out!
### Bootstrapping Argo CD
```
kind create cluster --config kind-cluster.yaml
kubectl apply -k argocd
kubectl apply -f apps.yaml
```

This example includes a `devcontainer` configuration, allowing you to automatically create an environment for testing using the VSCode Dev Containers extension or GitHub Codespaces.

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/morey-tech/argocd-v2.10-examples)

### Accessing the UI
Navigate to [https://localhost:8080/](https://localhost:8080/) on the machine with the `kind` cluster running.

Get the generated `admin` password.
```
argocd admin initial-password -n argocd
```

### Clean Up
```
kind delete cluster --name argocd-v2-10-examples
```
