# Docker: Integrating Custom Network in Docker Containers

### What Will We Accomplish

* This is a simple method of taking control of our networking so that we can better integrate our networking components (IP, gateway, etc) into our local environment. Learn how to defeat the defaults for full control!

* Learn to build a bridge adaptor that we can use for our docker network on another IP range

* Currently no way to set a static IP for a specific container using a command line argument when launching a specific  contianer



### Prerequisites

* Centos7 VM running docker





### Get Started

1.  Stop docker service

   ```bash
   root@centos1 ~]# ps aux | grep docker
   root      3883  0.3  1.4 563148 56208 ?        Ssl  16:07   0:00 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
   root      4671  0.0  0.0 112712   976 pts/1    S+   16:09   0:00 grep --color=auto docker
   ```

   ```bash
   [root@centos1 ~]# systemctl stop docker
   [root@centos1 ~]# ps aux | grep docker
   root      4680  0.0  0.0 112708   972 pts/1    S+   16:11   0:00 grep --color=auto docker
   ```

   * Stop service and verify it is no longer running



### Build Bridge Adaptor

* Use IP commands to build adaptor dynamically on the command line

* Adaptor will be available now, but not persistant across reboots

1. Create network interface type bridge to an interface name

   ```bash
   [root@centos1 ~]# ip link add br10 type bridge
   ```

        "br10" will not conflict with any VM interface names 

2.  Add IP Range to the br10 interface

   ```bash
   [root@centos1 ~]# ip addr add 10.10.100.1/24 dev br10
   ```

3. Link together the bridge adaptor and turn it on

   ```bash
   [root@centos1 ~]# ip link set br10 up
   ```

4. Verify bridge connection

   ```bash
   [root@centos1 ~]# ip addr
   1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
       link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
       inet 127.0.0.1/8 scope host lo
          valid_lft forever preferred_lft forever
       inet6 ::1/128 scope host 
          valid_lft forever preferred_lft forever
   2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
       link/ether 52:54:00:fc:66:66 brd ff:ff:ff:ff:ff:ff
       inet 192.168.122.92/24 brd 192.168.122.255 scope global noprefixroute dynamic eth0
          valid_lft 2683sec preferred_lft 2683sec
       inet6 fe80::4a47:408d:4730:57e6/64 scope link noprefixroute 
          valid_lft forever preferred_lft forever
   3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
       link/ether 02:42:7d:71:df:b2 brd ff:ff:ff:ff:ff:ff
       inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
          valid_lft forever preferred_lft forever
   4: br10: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UNKNOWN group default qlen 1000
       link/ether 62:b4:ca:1e:fb:f7 brd ff:ff:ff:ff:ff:ff
       inet 10.10.100.1/24 scope global br10
          valid_lft forever preferred_lft forever
       inet6 fe80::60b4:caff:fe1e:fbf7/64 scope link 
          valid_lft forever preferred_lft forever
   [root@centos1 ~]# 
   
   ```



### Configure Docker to Use br10 network






























