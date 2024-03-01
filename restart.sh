#!/bin/bash
clear
/etc/init.d/ssh restart
/etc/init.d/dropbear restart
/etc/init.d/stunnel4 restart
/etc/init.d/openvpn restart
systemctl restart --now openvpn-server@server-tcp-1194
systemctl restart --now openvpn-server@server-udp-2200
/etc/init.d/fail2ban restart
/etc/init.d/cron restart
/etc/init.d/nginx restart
/etc/init.d/squid restart
systemctl restart xray
systemctl restart xray@none
systemctl restart trojan-go
systemctl restart cdn-dropbear
systemctl restart cdn-ovpn
systemctl restart cdn-ssl
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
clear
echo "-----------------------------------------";
echo "------=[ All Services Restart Successful ]=-----";
echo "-----------------------------------------";
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
clear
menu