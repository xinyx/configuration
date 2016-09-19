#!/bin/sh
sudo modprobe ipv6
#sudo modprobe sit 
sudo ip tunnel del sit1
inet4=$(ifconfig | grep broadcast | awk '{print $2}')
sudo ip tunnel add sit1 mode sit remote 59.66.4.50 local $inet4
sudo ifconfig sit1 up 
sudo ifconfig sit1 add 2001:da8:200:900e:0:5efe:$inet4/64
sudo ip route add ::/0 via 2001:da8:200:900e::1 metric 1
sudo modprobe sit 

