# EXAM_DOCKER

### make docker in aws

```
docker build -t m11parveen .
```

### pop-server information

put in file yes to no in xinetd ipop..

and cp to docker

start docker net popnet

```
[root@73d733b488c5 docker]# nmap localhost

Starting Nmap 7.60 ( https://nmap.org ) at 2019-05-03 09:30 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0000040s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 996 closed ports
PORT    STATE SERVICE
110/tcp open  pop3
143/tcp open  imap
993/tcp open  imaps
995/tcp open  pop3s
```


**crete docker nerwork**

```
[root@ip-172-31-20-221 examDocker]# docker network create popnet
f137908b5828ee472900090edb375c744c207d48d07b7e721684c83ffc3b1398

```

**start server**
```
docker run --rm --name popserver -h popserver --network  popnet -it m11parveen /bin/bash
```



**important to open port aws**

```
telnet
ssh

```

**workind in docker**

```
[root@popserver docker]# telnet localhost 110
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
+OK POP3 localhost 2007f.104 server ready
USER pere
+OK User name accepted, password please
PASS pere
+OK Mailbox open, 0 messages
```


** aws cheaking**

```
[fedora@ip-172-31-20-221 ~]$ telnet 172.22.0.2 110
Trying 172.22.0.2...
Connected to 172.22.0.2.
Escape character is '^]'.
+OK POP3 popserver 2007f.104 server ready
USER pere
+OK User name accepted, password please
PASS pere
+OK Mailbox open, 0 messages
USER anna
-ERR Unknown TRANSACTION state command
35.178.211.835.178.211.8
```

**try from host aula**

```
[isx0276204@i03 xinetd.d]$ telnet 35.178.211.8 110
Trying 35.178.211.8...
Connected to 35.178.211.8.
Escape character is '^]'.
+OK POP3 popserver 2007f.104 server ready
USER pere
+OK User name accepted, password please
PASS pere
+OK Mailbox open, 0 messages
35.178.211.8
``

** start from aula host must open 110 de aws and ..**

```
docker run --rm --name popserver -h popserver -p 110:110 --network  popnet -it m11parveen /bin/bash
```
**and need to start server by using command because not start detch**

```
./startup.sh
```



