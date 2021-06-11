# Kubernetes 101

## kubectl Common Commands
* Deploy an app to a k8s cluster:
  ``` bash
  kubectl create deployment deployment_name --image=some_image:tag
  ```

* Get deployment info:
  * display basic deployment info - `kubectl get deployment deployment_name`
    ``` bash
    $ kubectl get deployment hello-go 
    NAME       READY   UP-TO-DATE   AVAILABLE   AGE
    hello-go   1/1     1            1           5m23s
    ```

  * Get specific pod info - `kubectl get pod -l app=deployment_name`
    ``` bash
    $ kubectl get pod -l app=hello-go
    NAME                        READY   STATUS    RESTARTS   AGE
    hello-go-6b57b7658f-c6llz   1/1     Running   0          12m
    ```
  * Detailed pod info - `kubectl describe pod -l app=deployment_name`
    ``` bash
    $ kubectl describe pod -l app=hello-go
    Name:         hello-go-6b57b7658f-c6llz
    Namespace:    default
    Priority:     0
    Node:         kube101-pool-8xnon/10.108.0.3
    Start Time:   Wed, 14 Apr 2021 11:25:52 -0400
    Labels:       app=hello-go
                  pod-template-hash=6b57b7658f
    Annotations:  <none>
    Status:       Running
    IP:           10.244.1.116
    IPs:
      IP:           10.244.1.116
    Controlled By:  ReplicaSet/hello-go-6b57b7658f
    Containers:
      kube101-go:
        Container ID:   containerd://   c2863ddd98add56c047104f3f4d39b791dee91858f68857ab8f5accc246d8c6c
        Image:          joeyengel/kube101-go:latest
        Image ID:       docker.io/joeyengel/    kube101-go@sha256:a91410916caccc6fe6fb870b3bef48538546e14737ba05eeb2a8d46559b4b2a2
        Port:           <none>
        Host Port:      <none>
        State:          Running
          Started:      Wed, 14 Apr 2021 11:25:55 -0400
        Ready:          True
        Restart Count:  0
        Environment:    <none>
        Mounts:
          /var/run/secrets/kubernetes.io/serviceaccount from default-token-m9wfl (ro)
    Conditions:
      Type              Status
      Initialized       True 
      Ready             True 
      ContainersReady   True 
      PodScheduled      True 
    Volumes:
      default-token-m9wfl:
        Type:        Secret (a volume populated by a Secret)
        SecretName:  default-token-m9wfl
        Optional:    false
    QoS Class:       BestEffort
    Node-Selectors:  <none>
    Tolerations:     node.kubernetes.io/not-ready:NoExecute for 300s
                     node.kubernetes.io/unreachable:NoExecute for 300s
    Events:
      Type    Reason     Age   From                         Message
      ----    ------     ----  ----                         -------
      Normal  Scheduled  15m   default-scheduler            Successfully assigned default/  hello-go-6b57b7658f-c6llz to kube101-pool-8xnon
      Normal  Pulling    15m   kubelet, kube101-pool-8xnon  Pulling image "joeyengel/kube101-go:latest"
      Normal  Pulled     15m   kubelet, kube101-pool-8xnon  Successfully pulled image   "joeyengel/kube101-go:latest" in 1.106699284s
      Normal  Created    15m   kubelet, kube101-pool-8xnon  Created container kube101-go
      Normal  Started    15m   kubelet, kube101-pool-8xnon  Started container kube101-go
    ```

* Map a k8s application port to a local port - `kubectl expose deployment hello-go --port=80 --target-port=8180 --type=NodePort`
  * k8s applications run on a private IP, so we need to expose required ports to properly route traffic and access the app
  * This command creates a `service` that with the same name as the `deployment_name`

* Get servce info - `kubectl get service hello-go`
  ``` bash
  $ kubectl get service hello-go
  NAME       TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
  hello-go   NodePort   10.245.243.167   <none>        80:30942/TCP   3s
  ```

* Get Node info (similar to docker info)- `kubectl get nodes -o json|jq`
  * Better alternative - `kubectl get nodes -o wide`
    ``` bash
    $ kubectl get nodes -o wide
    NAME              STATUS   ROLES    AGE   VERSION   INTERNAL-IP   EXTERNAL-IP       OS-IMAGE                       KERNEL-VERSION    CONTAINER-RUNTIME
    kube-pool-8xx14   Ready    <none>   45m   v1.20.2   10.108.0.3    104.236.209.165   Debian GNU/Linux 10 (buster)   4.19.0-11-amd64   containerd://1.4.3
    kube-pool-8xx1h   Ready    <none>   45m   v1.20.2   10.108.0.5    104.236.209.167   Debian GNU/Linux 10 (buster)   4.19.0-11-amd64   containerd://1.4.3
    kube-pool-8xx1k   Ready    <none>   45m   v1.20.2   10.108.0.4    104.236.209.166   Debian GNU/Linux 10 (buster)   4.19.0-11-amd64   containerd://1.4.3
    ```

* Get External IPs of all nodes - `kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'`

* Change an image for a running deployment - `kubectl set image deployment/deployment_name container_name=newimage/name:tag`

* Rollback a deployment to a k8s cluster:
  * Get deployment history - `kubectl rollout history deployment hello-go`
    ``` bash
    $ kubectl rollout history deployment hello-go
    deployment.apps/hello-go 
    REVISION  CHANGE-CAUSE
    1         <none>
    2         <none>
    ```

  * Rollback most recent deployment - `kubectl rollout undo deployment hello-go`

* Export k8s cluster config - `kubectl get deployments.apps hello-go -o yaml > kube101-hello-go.yaml`
  * Useful for spinning up a managed k8s cluster in the cloud that doesn't need 100% availability.  Export the config before destroying the k8s service, then when you need to get back to the running state, create a new k8s service, download/export the kubectl config file, and run `kubectl apply -f kube101-hello-go.yaml` to set up the nodes/pods 
    * Note - you will need to re-expose the deployment ports and use the new external ip/port to access the site.

## Kubernetes Environment Setup
* `minikube` - Tool that lets you run a single-node k8s cluster on your local computer
* `kubectl` - kubectl controls the Kubernetes cluster manager
* Setup minikube on Fedora:
  * Install docker: https://docs.docker.com/engine/install/fedora/
  * Add user to docker group:
    ```
    sudo usermod -aG docker $USER
    ```
    * note: must logout/login for login session to see new group  
  * Enable/Start docker: 
    ```
    sudo systemctl enable docker && sudo systemctl start docker
    ```
  * Install k8s: 
    ```
    sudo dnf install -y kubernetes
    ```
  * Install minikube:
    ``` bash
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    ```
    ``` bash
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    ```

<br>
<br>

## Connect to Cloud k8s cluster
* Download cluster config file
* mv config file to `~/.kube/`:
  ``` bash
  joey@xps15: ~ $ mv Downloads/kube101-kubeconfig.yaml ~/.kube/config-kube101.yaml
  ``` 
* Set kubectl config to the cloud config file:
  ``` bash
  export KUBECONFIG=~/.kube/config-kube101.yaml
  ```
* Verify:
  ``` bash
  joey@xps15: ~/Downloads $ kubectl get nodes
  NAME                 STATUS   ROLES    AGE   VERSION
  kube101-pool-8y161   Ready    <none>   30m   v1.20.2
  kube101-pool-8y169   Ready    <none>   30m   v1.20.2
  kube101-pool-8y16z   Ready    <none>   30m   v1.20.2
  ```


<br>
<br>

## Connect DockerHub Creds to k8s cluster
* Create a secret docker-registry file:
``` bash
joey@xps15: ~/Downloads $ kubectl create secret docker-registry regcred \
> --docker-username=dockerhub_username \
> --docker-password=dockerhub_access_token \
> --docker-email=dockerhub@email
secret/regcred created
```
* View secrets 
``` bash
joey@xps15: ~/Downloads $ kubectl get secrets
NAME                  TYPE                                  DATA   AGE
default-token-n4dmq   kubernetes.io/service-account-token   3      74m
regcred               kubernetes.io/dockerconfigjson        1      3m10s
```

## Building Container Images Directly Inside minikube
1. Switch docker images context to using minikube's built-in docker:
``` bash
joey@xps15: ~ $ docker images
REPOSITORY                    TAG        IMAGE ID       CREATED          SIZE
joeyengel/kube101-go          latest     b110f5602882   12 minutes ago   11.8MB
<none>                        <none>     e2ca8222d0f4   25 minutes ago   308MB
gcr.io/k8s-minikube/kicbase   v0.0.20    c6f4fc187bc1   4 days ago       1.09GB
golang                        1-alpine   14ee78639386   12 days ago      301MB
alpine                        latest     49f356fa4513   13 days ago      5.61MB
joey@xps15: ~ $ eval $(minikube docker-env)
joey@xps15: ~ $ docker images
REPOSITORY                                TAG        IMAGE ID       CREATED         SIZE
gcr.io/k8s-minikube/storage-provisioner   v5         6e38f40d628d   2 weeks ago     31.5MB
k8s.gcr.io/kube-proxy                     v1.20.2    43154ddb57a8   3 months ago    118MB
k8s.gcr.io/kube-controller-manager        v1.20.2    a27166429d98   3 months ago    116MB
k8s.gcr.io/kube-apiserver                 v1.20.2    a8c2fdb8bf76   3 months ago    122MB
k8s.gcr.io/kube-scheduler                 v1.20.2    ed2c44fbdd78   3 months ago    46.4MB
kubernetesui/dashboard                    v2.1.0     9a07b5b4bfac   4 months ago    226MB
k8s.gcr.io/etcd                           3.4.13-0   0369cf4303ff   7 months ago    253MB
k8s.gcr.io/coredns                        1.7.0      bfe3a36ebd25   10 months ago   45.2MB
kubernetesui/metrics-scraper              v1.0.4     86262685d9ab   12 months ago   36.9MB
k8s.gcr.io/pause                          3.2        80d28bedfe5d   14 months ago   683kB
```

## Set up NFS Shared Storage Volume

Pods requires a persistant volume to store data, but a volume can only be attached to a single pod.  A simple (and cheap) way around this is to set up an NFS server and add it as a storage provisioning system to your kubernetes cluster.

1. Create an instance in the same region as your k8s cluster
  * Use Debian 10 (you will see why in later steps)
  * give this server a private IP (we only want the NFS share accessible internally)
2. Run the Ansible playbook [here](https://github.com/JosephEngel/kubernetes-101/tree/master/episode-05/nfs-server)
  * Note: you will need to install a few ansible-galaxy roles, and edit the inventory file to include the public IP of your newly created instance
3. You should have an NFS server set up and running.  You can confirm by ssh-ing into the server and running `ps aux |grep nfs`

Now that the NFS server is setup, we need to add it as a storage provisioning system.  To do so, run the following commands:
  ```
  helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner
  ```

  ```
  helm install nfs nfs-subdir-external-provisioner/nfs-subdir-external-provisioner --set nfs.server=x.x.x.x --set nfs.path=/home/nfs
  ```

Lastly, you will need to edit your deployment file to use the nfs share.  It should have something similar to this:
```
---
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: drupal-files-pvc
  namespace: drupal
spec:
  accessModes:
    - ReadWriteMany  # Was ReadWriteOnce before; required to have multiple pods use same storage
  resources:
    requests:
      storage: 1Gi
  storageClassName: nfs-client  # Use the new nfs storage
```
