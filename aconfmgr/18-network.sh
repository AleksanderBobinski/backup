CopyFile /etc/xdg/reflector/reflector.conf
CreateDir /etc/cni/net.d 700
CopyFile /etc/NetworkManager/conf.d/dns.conf
CreateDir /etc/openvpn/client 750 openvpn network
CreateDir /etc/openvpn/server 750 openvpn network
