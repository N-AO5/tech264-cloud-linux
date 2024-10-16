
#!/bin/bash
 
# configure iptables
 
echo "Configuring iptables..."
 
# Accept all incoming and outgoing traffic on the loopback interface (lo)
sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT
 
# Allow incoming traffic that is part of an established or related connection
sudo iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
 
# Allow outgoing traffic that is part of an established connection
sudo iptables -A OUTPUT -m state --state ESTABLISHED -j ACCEPT
 
# Drop all incoming traffic that is in an invalid state (e.g., malformed packets)
sudo iptables -A INPUT -m state --state INVALID -j DROP
 
# Allow incoming SSH connections on port 22 and accept new and established connections
sudo iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
# Allow outgoing traffic from SSH (port 22) only for established connections
sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
 
# uncomment the following lines if want allow SSH into NVA only through the public subnet (app VM as a jumpbox)
# this must be done once the NVA's public IP address is removed
#sudo iptables -A INPUT -p tcp -s 10.0.2.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT
 
# uncomment the following lines if want allow SSH to other servers using the NVA as a jumpbox
# if need to make outgoing SSH connections with other servers from NVA
#sudo iptables -A OUTPUT -p tcp --dport 22 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
#sudo iptables -A INPUT -p tcp --sport 22 -m conntrack --ctstate ESTABLISHED -j ACCEPT
 
# Allow forwarding of traffic from the 10.0.2.0/24 subnet to the 10.0.4.0/24 subnet on port 27017 (typically MongoDB)
sudo iptables -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.4.0/24 --destination-port 27017 -m tcp -j ACCEPT
 
# Allow forwarding of ICMP traffic (ping) between the 10.0.2.0/24 and 10.0.4.0/24 subnets for new and established connections
sudo iptables -A FORWARD -p icmp -s 10.0.2.0/24 -d 10.0.4.0/24 -m state --state NEW,ESTABLISHED -j ACCEPT
 
# Set the default policy for the INPUT chain to DROP (block all incoming traffic not explicitly allowed)
sudo iptables -P INPUT DROP
 
# Set the default policy for the FORWARD chain to DROP (block all forwarding traffic not explicitly allowed)
sudo iptables -P FORWARD DROP
 
echo "Done!"
echo ""
 
# make iptables rules persistent
# it will ask for user input by default
 
echo "Make iptables rules persistent..."
sudo DEBIAN_FRONTEND=noninteractive apt install iptables-persistent -y
echo "Done!"
echo ""
 