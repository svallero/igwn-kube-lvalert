# igwn-kube-lvalert
Lvalert deployment on Kubernetes on premises. It was developed for a Kubernetes cluster managed by Rancher on OpenStack. Some details might change for different Cloud providers. For instance, you might need to adjust the StorageClass for persistent volumes. 

**TODO:** 
- external IP provisioning and certificate handling
- high-availability configuration with more than one replicas

Apply the following manifests with:
```kubectl apply -f <manifest_name>.yaml```


