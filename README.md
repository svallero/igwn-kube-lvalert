# igwn-kube-lvalert
Lvalert deployment on Kubernetes cluster on premises. It was developed for a Kubernetes cluster managed by Rancher on OpenStack. Some details might change for different Cloud providers. For instance, you might need to adjust the StorageClass for persistent volumes. 

**TODO:** 
- external IP provisioning and certificate handling
- high-availability configuration with more than one replica

## 0 - Create you custom image (optional)
The Openfire Docker image is created from the existing project: [quantumobject/docker-openfire](https://github.com/QuantumObject/docker-openfire). The custom entrypoint produces the desired *openfire.xml* configuration file starting from a template and some environment variable. 

**NB:** if the database has already been initialized, the contents of *openfire.xml* are not applied!

Apply the following manifests with:

```kubectl apply -f <manifest_name>.yaml```

## 1 - namespace.yaml
Group all resources under the same namespace.

## 2 - mysql-volume.yaml and openfire-volume.yaml
Create persistent volumes for Openfire and database. You might need to edit these files. 

## 3 - kustomization.yaml
Insert your secrets here. The kustomization file is applied with:

```kubectl apply -k .```

The file name must be *kustomization.yaml*.

## 4 - lvalert.yaml
This manifest creates the actual deployment: a single Pod with 2 containers, one for Openfire and one for the Mysql database. 

## 5 - service.yaml
Allow the Pod to be reached from the outside. You might need to edit this file if you want to use a different service type.
If you keep the NodePort service type, you should see something like this:
```
-bash-4.2$ kubectl get svc -n lvalert
NAME      TYPE       CLUSTER-IP     EXTERNAL-IP   PORT(S)                                        AGE
lvalert   NodePort   10.43.188.95   <none>        9090:31723/TCP,5222:32371/TCP,8001:30870/TCP   23d
```

## 6 - Create the *gracedb* user (manual step)
Login to the Lvalert web interface, create the *gracedb* user and grant her permission to create nodes.

If you use the NodePort service type, the web interface is reachable at the Pod host IP, on the port mapped to the 9090 one (31723 in the example above). 

## 7 - add_nodes.yaml
This runs a Job that adds all the required PubSub nodes.
