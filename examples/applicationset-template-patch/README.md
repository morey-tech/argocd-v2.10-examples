# Argo CD 2.10 Examples
## ApplicationSet Template Patch
Implemented in [#14893](https://github.com/argoproj/argo-cd/pull/14893) by [speedfl](https://github.com/speedfl), closing [#11164](https://github.com/argoproj/argo-cd/issues/11164) and [#9177](https://github.com/argoproj/argo-cd/issues/9177).

> With this new feature, you can define templates without being limited to string-only fields. This gives you more granular control over your configurations. For example, you can toggle fields under source to generate applications from different repositories, such as Helm charts from Bitnami and customized packages from private repos.
> 
> One of the most common use cases for this feature is toggling auto sync on and off using values from AppSet generators. This is a very common practice when end users are testing changes against a specific environment and they don’t want their changes to be erased if there is a commit to Git.

Other examples of when `templatePatch` would be useful include:
- Using Helm and Kustomize in the same ApplicationSet, and you need to include fields specific to these sources (e.g. `helm.valueFiles` or `kustomize.components`).
- Conditional `ignoreDifferences` when using an ApplicationSet. For example, if an ApplicationSet is deploying cluster services `kyverno` and `crossplane`, but only the `crossplane` Application will need to ignore certain fields.

In this example, the `templatePatch` is used to conditionally enable the automated sync policy and resource pruning.
```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: guestbooks
  namespace: argocd
spec:
  ...
  templatePatch: |
    {{- if .autoSync }}
    spec:
      syncPolicy:
        automated:
          prune: {{ .prune }}
    {{- end }}
```

Each element in the `list` generator will specify if `autoSync` or `prune` should be enabled.
```yaml
  generators:
  - list:
      elements:
        - env: dev
          autoSync: true
          prune: true
        - env: stg
          autoSync: true
          prune: false
        - env: prd
          autoSync: false
          prune: false
```
Here, `dev` and `stg` have the automated sync policy enabled, but `stg` has resource pruning disabled. The `prd` environment, has both `autoSync` and `prune` disabled.

**Note**: When writing a `templatePatch`, you're crafting a patch. So, if the patch includes an empty `spec:`, it will effectively clear out existing fields. See [#17040](https://github.com/argoproj/argo-cd/issues/17040) for an example of this behavior.

[Link to the documentation](https://argo-cd.readthedocs.io/en/latest/operator-manual/applicationset/Template/#template-patch).