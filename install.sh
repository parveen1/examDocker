#! /bin/bash
# 
# -------------------------------------
cp /opt/docker/ipop3 /etc/xinetd.d/ipop3
cp /opt/docker/pop3s /etc/xinetd.d/pop3s

useradd pere
useradd marta

echo "pere" | passwd --stdin pere
echo "marta" | passwd --stdin marta

rm -rf /var/spool/mail/* 

cp /opt/docker/marta /var/spool/mail/marta 
cp /opt/docker/pere /var/spool/mail/pere


chown -R marta.marta /var/spool/mail/marta
chown -R pere.pere /var/spool/mail/pere

