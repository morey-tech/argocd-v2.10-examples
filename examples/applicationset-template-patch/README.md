# Argo CD 2.10 Examples
## ApplicationSet Template Patch
Implemented in [#14893](https://github.com/argoproj/argo-cd/pull/14893) by [speedfl](https://github.com/speedfl), closing [#11164](https://github.com/argoproj/argo-cd/issues/11164) and [#9177](https://github.com/argoproj/argo-cd/issues/9177).

> With this new feature, you can define templates without being limited to string-only fields. This gives you more granular control over your configurations. For example, you can toggle fields under source to generate applications from different repositories, such as Helm charts from Bitnami and customized packages from private repos.
> 
> One of the most common use cases for this feature is toggling auto sync on and off using values from AppSet generators. This is a very common practice when end users are testing changes against a specific environment and they don’t want their changes to be erased if there is a commit to Git.

- ApplicationSet template patch, use helm and kustomize in the same appset.
- Dynamic ignoreDifferences when using AppSet
- https://argo-cd.readthedocs.io/en/latest/operator-manual/applicationset/Template/#template-patch
