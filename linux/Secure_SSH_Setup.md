# Secure SSH Setup

### Initial Setup

1. Install SSH

```bash
sudo yum install openssh-server
```

2. Start/Enable SSH

   ```bash
   sudo systemctl enable sshd && sudo systemctl start sshd
   ```

### Configuration Changes

Config file: `/etc/ssh/sshd_config`

1. Disable root login

   ```bash
   PermitRootLogin no
   ```

2. Change default Port

   *   Add port to SELinux 

     * `sudo semanage port -a -t ssh_port_t -p tcp 2244`

   * Add port to firewalld

     * `sudo firewall-cmd --permanent --zone=public --add-port=2244/tcp`

     * `sudo firewall-cmd --reload`

   * Restart sshd

     * `sudo systemctl restart sshd.service`



         

3. Disable password-based logins

```bash
PasswordAuthentication no
```

### Set up key/pair logins

1. Generate Key

   `keygen -t rsa`

2. Connect (from host)

   `ssh-copy-id username@192.168.122.xxx`
