# Argo CD 2.10 Examples
## Application Controller Sync Jitter
> Whenever we hit the timeout.reconciliation, the controller triggers a refresh of almost all applications to the repo-server. With a high volume of applications, this creates CPU spikes on the controller and especially on the repo-server when a monorepo is used for multiple applications.
> 
> Using scheduling jitter would allow the repo-server to have a more evenly distributed load, reduce spikes, reduce the time it takes to refresh apps and reduce repo-server cost.

- https://github.com/argoproj/argo-cd/pull/16820
- https://github.com/argoproj/argo-cd/issues/14241

- https://github.com/argoproj/argo-cd/issues/8172#issuecomment-1912339917
> I bumped my version to v2.10.0-rc4 in order to test jitter implementation on reconciliation. [...] The results till now are incredible, no delay at all in ArgoCD UI/Front. If i delete a pod, the new pod appears instantly
