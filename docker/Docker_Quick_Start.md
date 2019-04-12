# Docker Quick Start

* **Docker file system location - `/var/lib/docker`**

## Docker Commands (All)

* `docker images` - View local docker images 

* `docker image ls` -  View local docker images

* `docker container run ID` - run a container image

  * flags

    * `-i`  - interactive

    * `-t`  - spin up sudo tty 

    * `-d` - detach (run contianer in background & print ID)

    * `--name` - name our container

    * `-p 80:80` - map host port 80 to container port 80

    * `-P` - random host port will be mapped to container port

    * `--mount source=volume,target=/xxx` - attach docker volume

    * `-v volume:/xxx` - attach docker volume

    * `--net ID` - specify docker network

    * `--dns=1.1.1.1` - Set custom DNS 

* Rename container - `docker container rename currentName newName`

* `docker container ps` or `docker container ls` - list all running containers   

* `docker container ls -a` - show all running and previously running containers

* stop a container (within said container) - `exit`

* start a stopped container - `docker container start ID/name`

* enter a container (if tty was specified) - `docker container attach ID`

* enter a container (no tty specified) - `docker exec -it ID sh`

* Delete a container - `docker container rm ID/name`

* Delete a docker image - `docker rmi ID` or `docker image rm ID`

* log into docker hub - `docker login`

* Name local container image repo & tag - `docker tag ID repo:tag`

* Push image to docker hub - `docker push repository`

* Pull image from docker hub - `docker pull armnhmr/onboarding:v1`

* docker image history  - `show what ports are opened on container image`

* `docker volume ls` - list docker volumes

* `docker volume create volume-1`  - create a docker volume

* `docker volume inspect volume` - get volume information

* mount image to volume - `docker run -d --mount source=volume,target=/app ID`

* execute command within running container - `docker container exec ID command`

* View logs of container - `docker container logs ID`

* create container and run command/script - `docker container run -d ID /bin/bash -c "command here"`

* docker network ls - View all docker networks

* `docker network inspect ID` - Get detailed information on a docker network

* `docker container stats` - get all container system information (CPU%, RAM, I/O)

  - `docker container stats ID` - get specific container system information

* `docker save --output centos.latest.tar centos:latest` - save docker image in current directory

* `docker load --input centos.latest.tar.gz` - load docker image file into local docker repository

  - Works with .tar or compressed files

* `docker history image:tag` - View build history of building base image

## Installation and Configuration

1. Install `dnf-plugins-core` to manage DNF repos from the command line:

   `$ sudo dnf -y install dnf-plugins-core`

2. Add the stable docker repo (community edition):

   ```bash
   $ sudo dnf config-manager \
      --add-repo \
      https://download.docker.com/linux/fedora/docker-ce.repo
   ```

3. Install docker ce:

   `$ sudo dnf install docker-ce`

   * Make sure the gpg key is: `060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35 `

4. Enable & start docker:

   `$ sudo systemctl enable docker && sudo systemctl start docker`

5. Verify docker was installed correctly by running a hello-world container:

   `$ sudo docker run hello-world`

6. Add any other users to the `docker group`:

   `$ sudo usermod -a -G docker joey `

## Docker Images

#### Example: Create a company "Onbording image"

* ![onboarding image](onboarding.png)

1. Get the base image:

   1. pull ubuntu 18.04 image: `docker pull ubuntu:18.04`

      ![pull_image](pull_image.png)

   2. `docker images` shows: tag, image ID, when it was created, image size

      * Tag - can be whatever we want

      * image ID - UUID used to specify the image.  View full id will `docker images --no-trunc`

2. Create a dockerfile:

   ```vim
   FROM ubuntu:18.04
   LABEL maintainer="striker328@keemail.me"
   RUN apt-get update
   RUN apt-get install -y python3
   ```

3. build the docker image: `docker build .`

4. Verify onboarding image:

   ![onboard_image_verify](onboard_image_verify.png)

#### The Dockerfile

* Used to create your own docker images with a text file names "dockerfile"

* dockerfile example:

  * ```vim
    FROM ubuntu:18.04
    LABEL maintainer="striker328@keemail.me"
    RUN apt-get update
    RUN apt-get install -y python3
    ```

## Running Containers

* run our unnamed docker image:

  * docker container run -it --name python-container 537e58654166

    * ![running_conatiners_1](running_containers_1.png)

      * Note how our prompt has changed to show that we are now in the container

  * to exit the container, use `ctrl + p` + `ctrl + q`

  * to stop the contaienr, type `exit`.

  * to start up a stopped container, type `docker container start containerID`

  * to enter the container, type `docker container attach ID`

* Container Lifecycle:

  * ![running_containers_lifecycle](running_containers_lifecycle.png)

## Image & Container Management

* Remove a container - `docker container rm ID/name`

* Remove a docker image - `docker rmi ID`

  #### Save local docker image to docker hub:

  1. log into docker hub: `docker login`

  2. Name image repo & tag - `docker tag ID repo:tag`

     1. ex.)  `docker tag 537e58654166 armnhmr/onboarding:v1`

  3. Push image to docker hub - `docker push repository`

     1. ![](image_container_management_push.png)

        * pushed our 2 image layers (update, install python3) and copied the original 4 layers from the ubuntu base image

     2. ![DockerHub repo view](img_container_mgmt_2.png)

        * Here we can see our newly created 'onboarding' repo

  #### Pull down our docker hub image:

  1. `docker pull armnhmr/onboarding:v1`

## Container Ports

* `docker container run -d nginx` to spin up new nginx container

  * `docker container ls`: we can see that port 80 is exposed in the container

    ![ports_1](ports_1.png)

  * `docker container inspect ID | grep IPAdd` - view what the ipaddr of the nginx server is

  * by default any exposed ports will NOT be remapped to localhost.

* `docker container run -itd -p 80 nginx:latest` - 

  * Ports are bound to all interfaces by default (network-wide)

  * `-p 80` flag randomly remaps port 80 to localhost high number port

  * `-p localhostport:containerport` flag will specify what port we want container port to be mapped to

  * `-P` flag will automatically remap all exposed ports and Dockerfile randomly

* Bind port to specific interface - `docker container run -itd -p 127.0.0.1:8081:80 nginx:latest`

  * nginx is only bound to localhost and cannot be accessed by other systems

* Bind only tcp/udp passthrough  - `docker container run -itd -p 8082:80/tcp nginx:latest`

* "exposed" vs "public" -  

  * exposed - opens port on container and makes it available to localhost

  * public - both host and container port can be specified and linked together to make it available to the outside world

* `docker image history` - show what ports are opened on container image

## Docker Volumes

* docker volumes - Preferred mechanism of persisting data that's generated by a container or generated to be used by a container

* `docker volume ls` - list docker volumes 

* `docker volume create volume-1` - create a docker volume

* `docker volume inspect volume` - get volume information

  * ![volume inspect](volumes_inspect.png)

* `docker container run -d --name devcont --mount source=devvolume,target=/app nginx` - create nginx container and mount it to the docker volume 'devvolume'

## Docker Command Prompt

* execute command within running container - `docker container exec ID command`

  * ex.) `docker container exec ID cat /etc/profile`

* View logs of container - `docker container logs ID`

* create container and run command/script - `docker container run -d ID /bin/bash -c "command here"`

## Dockerfile, Builds, Network Config

### Dockerfile

#### Dockerfile Directives: USER and RUN

* Create CentOS image that can start up with user w/o sudo
  1. Create Dockerfile:

     ```docker
     # Base CentOS image - non-privileged user entry
     
     # FROM must be first statement
     FROM centos:latest
     MAINTAINER striker328@keemail.me
     
     # RUN - Allows us to run commands
     # -ms = make homedir and specify shell
     RUN useradd -ms /bin/bash user
     USER user
     ```
     1. Connect as root user when root isn't default - `docker exec -u 0 -it ID /bin/bash`
        1. `-u 0` - specify that you want to connect as user 0, which is always root

  # 

#### Dockerfile Directivers: RUN Order of Execution

* Order of Execution is linear, from top to bottom

* Dockerfile:

  * ```docker
    # Base CentOS image - non-privileged user entry
    
    # "FROM" command must be the first statement
    FROM centos:latest
    MAINTAINER striker328@keemail.me
    
    # RUN - Allows us to run commands and becomes part of the base image                            
    # -ms = make home dir and specify shell
    RUN useradd -ms /bin/bash user
    USER user
    
    # export random network to random config file
    RUN echo "EXPORT 192.168.0.0/24" >> /etc/exports.list
    ```

    * THIS WILL NOT RUN - after specifying the user "user" as our default user, everything afterwards will be run under this user, who does not have proper rights.

  * Fixed:

    ```docker
    # Base CentOS image - non-privileged user entry
    
    # "FROM" command must be the first statement
    FROM centos:latest
    MAINTAINER striker328@keemail.me
    
    # RUN - Allows us to run commands and becomes part of the base image
    # -ms = make home dir and specify shell
    RUN useradd -ms /bin/bash user
    
    # export random network to random config file
    RUN echo "EXPORT 192.168.0.0/24" >> /etc/exports.list
    
    # Change entrypoint user to "user"
    USER user
    ```

    * Moved the  "user" entrypoint to the end of file so that the echo cmd would be run as root

#### Dockerfile Directives: ENV

* How to manage what environment we are placed into when container is created.

* Environment variables (ENV) )

* ```docker
  # Base CentOS image - non-privileged user entry
  
  # "FROM" command must be the first statement
  FROM centos:latest
  MAINTAINER striker328@keemail.me
  
  # RUN - Allows us to run commands and becomes part of the base image
  # -ms = make home dir and specify shell
  RUN useradd -ms /bin/bash user
  
  # export random network to random config file
  RUN echo "EXPORT 192.168.0.0/24" >> /etc/exports.list
  
  # Install some stuff
  # Set up dockerfile to be able to install things
  RUN yum update -y
  # Install net-tools and wget
  RUN yum install -y net-tools wget
  # go to home dir and download java via wget (doesn't need user interaction)
  RUN cd ~ && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn/pub/java/jdk/8u60-b27/jre-8u60-lunux-x64.rpm"
  
  # Install java
  RUN yum localinstall -y ~/jre-8u60-linux-x64.rpm
  
  # Change entrypoint user to "user"
  USER user
  
  # change user entrypoint to user's home dir and give user access to java 
  RUN cd ~ && echo "export JAVA_HOME=/usr/java/jdk1.8.0/jre" >> /home/user/.bashrc
  
  # ENV executes system-wide variable in key value format                                         
  # Create env variable so that any user can have access to Java binaries                         
  ENV JAVA_BIN /usr/java/jdk1.8.0/jre/bin
  ```

#### Dockerfile Directives: CMD vs. RUN

* `RUN` - Run command when building a container base image

* `CMD` - Run a command when spinning up a container from an image and no other command is passed during the container instanciation 

#### Dockerfile Directives: ENTRYPOINT

* `ENTRYPOINT` - Similar to CMD, but the command will be run no matter what else is passed when the container is started.

#### Dockerfile Directives: EXPOSE

* `EXPOSE` - exposes a port number when container is created.  Required to use the `-P` flag for automatic port re-mapping.

### Docker Network

* `docker network ls` - View all docker networks

* `docker network inspect ID` - Get detailed information on a docker network

#### Docker Networks

* Bridge - By default binds to all other devices on host

#### Create Networks

* man page -  `man docker-network-create`

* Create subnet - `docker network create --subnet 10.1.0.0/24 --gateway 10.1.0.1 name` 

  * ![subnet1](subnet-1.png)

#### Remove Network

* Do NOT remove any of the 3 default docker networks

* remove network - `docker network rm mybridge01`

  * ![subnet2](subnet-2.png)

#### Assign Network to Containers

1. Create a subnet

   * `docker network create --subnet 10.1.0.0/16 --gateway 10.1.0.1 --ip-range=10.1.4.0/24 --driver=bridge --label=host4network bridge04`
     * restricts ip usage to 10.1.4.1 - 10.1.4.255 

2. Create container using network

   * `docker run -it --name nettest1 --net bridge04 centos:latest /bin/bash`
     * `--net` - specify a docker network

3. Verify network within container

   * ![assign1](net-assign1.png)

     * We can see that the container is using the 10.1.4.0/24 network specified earlier

* Set static IP address on custom network -  `docker run -it --name nettest1 --net bridge04 --ip 10.1.4.100 centos:latest /bin/bash`
  * `--ip x.x.x.x` - set a static ip address

## Docker Commands and Structures

### Inspect Container Processes

* Search container for a specific process - `docker container exec ID /bin/ps aux | grep bash`

  * Must enter full path to command 

* See all running processes - `docker container top ID`

* `docker container stats` - get all container system information (CPU%, RAM, I/O)

  * `docker container stats ID` - get specific container system information

### Previous Container Management

* `docker container -f rm ID` - force the removal of a running container

* ``docker container rm `docker ps -a -q` `` - remove all stopped containers at once 

* remove container via filesystem:

  1. Stop docker - `sudo systemctl stop docker`

  2. View all containers - `ls -al  /var/lib/docker/containers`

  3. Remove containers - `rm -rf ID`

  4. Restart Docker - `sudo systemctl restart docker`

### Naming Containers

* Name container - `docker container run -it --name my_container_1 ...`

* Rename container - `docker container rename currentName newName`

### Docker Events

* `docker events` - View docker events in real time
  * `docker events -f filtername` - filter events based on event type
    * options - container, event, image, label, type, volume, network, daemon

    * example: joey@pc-fedora ~]$ docker events -f event=attach

      2019-03-15T19:19:58.410078047-04:00 container attach f81fc94c30b7d1e2abec5488b9c14a8c202eb5da001c0772c66f4f7c2acadc11 (image=ubuntu:latest, name=attachto)

### Saving and Loading Docker Images

* `docker save --output centos.latest.tar centos:latest` - save docker image in current directory

  * ![tar_1_](save_to_tar_1.png)

* `docker load --input centos.latest.tar.gz` - load docker image file into local docker repository

  * Works with .tar or compressed files

### Image History

* `docker history image:tag` - View build history of building base image
  * ![history_1_](history_1.png)

    * Shows 4 layers - add a file, add label name, start bash shell, and then a bash shell we started

    * Image (9f38484d220f) is the image ID the image was based on

    * Image (a7822146faa3) is the image ID that was created when we committed it

  * `docker history --no-trunc image:tag` - shows full imageID

  * `docker history --quiet image:tag` - Show only IDs associated with container layers

### Taking Control of Our Tags

##### Repository Naming Convention

* Single name and a tag:

  * Common default tag - `latest`

  * Ex.) centos:latest

* Slash designation name:

  * user account or hostname then associated repository and tag

  * Ex.) engelj5/ubusshd:v1

##### Creating Tags

* May want to be able to refer to something else as a name for some reason

* Tag a repository with a different name: (Original Repo: centos:mine, ID: a7822146faa3)

  1. `docker tag a7822146faa3 mine/centos:v1.0`
     * ![tag_1](tag_1.png)

       * "new" repo is just a new tag

* Tag local repository based on repo name: (Local Repo: mine/centos:v1.0)

  1. `docker tag mine/centos:v1.0 pc-fedora/centos:v1.0.1b`
     * ![tag_2](tag_2.png)

  * Standard way to tag base image (pc-fedora/centos:v1.0.1b) based upon their underlying host image (mine/centos) to identify differently what we are doing. Now when we want to create containers based on the image (mine/centos), we will use pc-fedora/centos:v1.0.xx and have an internal reference to mine/centos' imageID.  When we want to remove these containers, we can remove the base image (pc-fedora/centos:v1.0.xx) without having to remove the base imageID reference (mine/centos).
    * Makes it easier to manage containers doing different things that are all based on a single base Image
