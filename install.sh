#! /bin/bash
# 
# -------------------------------------
cp  /opt/docker/imap /etc/xinetd.d/imap
cp /opt/docker/imaps /etc/xinetd.d/imaps
cp /opt/docker/ipop3 /etc/xinetd.d/ipop3
cp /opt/docker/pop3s /etc/xinetd.d/pop3s

useradd pere
useradd marta

echo "pere" | passwd --stdin pere
echo "marta" | passwd --stdin marta
