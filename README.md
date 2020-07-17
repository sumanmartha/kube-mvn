# Kube-mvn

## Kubernetes role binding
https://support.cloudbees.com/hc/en-us/articles/360038636511-Kubernetes-Plugin-Authenticate-with-a-ServiceAccount-to-a-remote-cluster

## Jenkins role:

    ---
    kind: Role
      apiVersion: rbac.authorization.k8s.io/v1beta1
      metadata:
        name: jenkins
      rules:
        - apiGroups: [""]
          resources: ["pods"]
          verbs: ["create","delete","get","list","patch","update","watch"]
        - apiGroups: [""]
          resources: ["pods/exec"]
          verbs: ["create","delete","get","list","patch","update","watch"]
        - apiGroups: [""]
          resources: ["pods/log"]
          verbs: ["get","list","watch"]
        - apiGroups: [""]
          resources: ["secrets"]
          verbs: ["get"]
        - apiGroups: [""]
          resources: ["services"]
          verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
        - apiGroups: ["extensions", "apps"]
          resources: ["ingresses"]
          verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
        - apiGroups: ["extensions", "apps"]
          resources: ["deployments"]
          verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]

##Jenkins role binding:

    ---
      apiVersion: rbac.authorization.k8s.io/v1beta1
      kind: RoleBinding
        metadata:
          name: jenkins
          namespace: cloudbees-core
        roleRef:
          apiGroup: rbac.authorization.k8s.io
          kind: Role
          name: jenkins
        subjects:
        - kind: ServiceAccount
          name: jenkins