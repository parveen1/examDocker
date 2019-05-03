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




