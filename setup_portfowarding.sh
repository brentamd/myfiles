iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 4001 -j DNAT --to-destination 10.0.0.161:80
iptables -A FORWARD -p tcp -d 10.0.0.161 --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -d 10.0.0.161 -p tcp --dport 80 -j SNAT --to-source 192.168.142.1
