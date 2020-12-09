# Delete VM From Terminal

### Relevant Files
* image location - `/var/lib/libvirt/images`

### Steps
---
Get VM name:
```
[root@node ~]# virsh list --all
    Id   Name            State
--------------------------------
    1    nextcloud       running
    2    nginx           running
    3    vpn             running
    -    ansible3        shut off
    -    ansible5        shut off
    -    ansible7        shut off
    -    ansibleVM       shut off
    -    fileServer      shut off
    -    jenkins         shut off
    -    jenkins_slave   shut off
```
Get vm image file:
```
[root@node ~]# virsh dumpxml --domain nginx | grep 'source file'
<source file='/var/lib/libvirt/images/nginx.qcow2'/>
```
Shutdown vm:
```
[root@node ~]# virsh destroy --domain nginx
``` 
Undefine VM
```
[root@node ~]# virsh undefine --domain nginx
``` 
Delete vm
```
[root@node ~]# rm /var/lib/libvirt/images/nginx.qcow2
```
