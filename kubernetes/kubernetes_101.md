# Kubernetes 101

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

