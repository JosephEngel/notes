# Wireguard Setup

1. Create Dirs (Server and Client)
    ```
    $ sudo su -
    $ mkdir /etc/wireguard && cd /etc/wireguard
    $ umask 077
    $ wg genkey | tee /etc/wireguard/privatekey | wg pubkey > /etc/wireguard/publickey
    $ wg genpsk > psk
    ```

2. Get Server Privatekey and PublicKey
    * The privateKey will go in the server's config, and the public key will go in the client config
    * On server
    ```
    $ cat /etc/wireguard/privatekey
    $ cat /etc/wireguard/publickey
    ```


3. Get Client PrivateKey and Pubkey
    * The privateKey will go in the client's config, and the public key will go in the server config
    * On client
    ```
    $ cat /etc/wireguard/privatekey
    $ cat /etc/wireguard/publickey
    ```

4. Create Server config
    * Run `vim /etc/wireguard/wg0.conf`
    ```
    [Interface]
    Address = 192.168.2.1/24
    SaveConfig = true
    PostUp = firewall-cmd --zone=public --add-port 51820/udp && firewall-cmd --zone=public --add-masquerade
    PostDown = firewall-cmd --zone=public --remove-port 51820/udp && firewall-cmd --zone=public --remove-masquerade
    ListenPort = 51820 # default port
    PrivateKey = ${Server privatekey}

    [Peer]
    PublicKey = ${Client Publickey}
    AllowedIPs = 192.168.2.2/32
    ```

5. Create Client Config
    * Run `vim /etc/wireguard/wg0.conf`
    ```
    [Interface]
    Address = 192.168.2.2/32
    SaveConfig = true
    ListenPort = 47981
    PrivateKey = ${Client PrivateKey}

    [Peer]
    PublicKey = ${Server PublicKey}
    AllowedIPs = 0.0.0.0/0
    Endpoint = serverIP:51820
    ```
6. forward IP Packets:
    * Add the following to `/etc/sysctl.conf`
    ``` 
    net.ipv4.ip_forward=1
    net.ipv6.conf.all.forwarding=1
    ```
    * Load the new settings:
    ```
    $ sysctl -p
    ```

7. Open Port on Firewall

8. Open Port into your Network

