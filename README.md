# igwn-kube-lvalert
Lvalert deployment on Kubernetes on premises. It was developed for a Kubernetes cluster managed by Rancher on OpenStack. Some details might change for different Cloud providers. For instance, you might need to adjust the StorageClass for persistent volumes. 

**TODO:** 
- external IP provisioning and certificate handling
- high-availability configuration with more than one replicas

## 0- Create you custom image (optional)
The Openfire Docker image is created from the existing project: [quantumobject/docker-openfire](https://github.com/QuantumObject/docker-openfire). The custom entrypoint produces the desired *openfire.xml* configuration file starting from a template and some environment variable. 

**NB:** if the database has already been initialized, the contents of *openfire.xml* are not applied!

Apply the following manifests with:

```kubectl apply -f <manifest_name>.yaml```

## 1 - namespace.yaml
Group all resources under the same namespace.

## 2 - mysql-volume.yaml and openfire-volume.yaml
Create persistent volumes for Openfire and database. You might need to edit this file. 

## 3 - kustomization.yaml
Insert your secrets here. The kustomization file is applyed with:

```kubectl apply -k .```

The file name must be *kustomization.yaml*.

