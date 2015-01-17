iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 4001 -j DNAT --to-destination replaceme:80
iptables -A FORWARD -p tcp -d replaceme --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -d replaceme -p tcp --dport 80 -j SNAT --to-source 192.168.142.1
