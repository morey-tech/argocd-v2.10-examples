# Argo CD 2.10 Examples
## PostDelete Hook Support
Implemented in [#16595](https://github.com/argoproj/argo-cd/pull/16595) by [alexmt](https://github.com/alexmt), closing [#7575](https://github.com/argoproj/argo-cd/issues/7575).

> Clean up resources after an Application has been deleted.


Use PostDelete hook to delete namespaces created by `CreateNamespace=true` sync option ([the most upvoted open issue](https://github.com/argoproj/argo-cd/issues/7875) as of 2024-01-30).
- Can't run the Job as a service account that is maintained in the same app, because the sa gets deleted before the job runs.