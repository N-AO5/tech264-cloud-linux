https://github.com/corinnai/tech264-cloud-linux/tree/main/linux#securing-the-database-with-a-dmz-subnet
 
8:53 am Meeting started

 
https://github.com/AdonisAlgos/tech264-cloud-linux/tree/main/azure
tech264-cloud-linux/azure at main · AdonisAlgos/tech264-cloud-linux
Contribute to AdonisAlgos/tech264-cloud-linux development by creating an account on GitHub.
 
brb
 
brb listening
 
/posts page working
 
back @ 10:54
 
do you guys get this on your post page whe you associate the route table?
 
{"reason":{"type":"Single","servers":{"10.0.4.4:27017":{"address":"10.0.4.4:27017","type":"Unknown","hosts":[],"passives":[],"arbiters":[],"tags":{},"minWireVersion":0,"maxWireVersion":0,"roundTripTime":-1,"minRoundTripTime":0,"lastUpdateTime":694663,"lastWriteDate":0,"error":{},"topologyVersion":null,"setName":null,"setVersion":null,"electionId":null,"logicalSessionTimeoutMinutes":null,"primary":null,"me":null,"$clusterTime":null}},"stale":false,"compatible":true,"heartbeatFrequencyMS":10000,"localThresholdMS":15,"setName":null,"maxElectionId":null,"maxSetVersion":null,"commonWireVersion":0,"logicalSessionTimeoutMinutes":null}}
 
yes
 
Error
 
sysctl net.ipv4.ip_forward
 
sudo nano /etc/sysctl.conf
 
sudo sysctl -p
 
#!/bin/bash
 
# configure iptables
 
echo "Configuring iptables..."
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A INPUT -m state --state INVALID -j DROP
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
 
# uncomment the following lines if want allow SSH into NVA only through the public subnet (app VM as a jumpbox)
# this must be done once the NVA's public IP address is removed
#sudo iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
 
# uncomment the following lines if want allow SSH to other servers using the NVA as a jumpbox
# if need to make outgoing SSH connections with other servers from NVA
#sudo iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.4.0/24 --destination-port 27017 -m tcp -j ACCEPT
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -A FORWARD -p icmp -s 10.0.2.0/24 -d 10.0.4.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -P INPUT DROP
 
# ADD COMMENT ABOUT WHAT THE FOLLOWING COMMAND(S) DO
sudo iptables -P FORWARD DROP
 
echo "Done!"
echo ""
 
# make iptables rules persistent
# it will ask for user input by default
 
echo "Make iptables rules persistent..."
sudo DEBIAN_FRONTEND=noninteractive apt install iptables-persistent -y
echo "Done!"
echo ""
 