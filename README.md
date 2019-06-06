# POP SERVER

### @PARVEEN 

Frist of all need git repositoris of examen if like to do some change.

if not than we use directly docker

[git-rep](https://github.com/parveen1/examDocker)

[docker-hub](https://hub.docker.com/u/parveen1992/m11extraparveen:v1)



## conf. aws 

```
 ssh -i schoolkey.pem fedora@3.8.122.202
```

**NOTE: in secrity group aws we must open port 110(pop) and 995(pops)**

**make docker network**

```
docker network create popnet
```

**clone repo**

```
git clone https://github.com/parveen1/examDocker.git
```

cd directory and go inside repo

make new image for docker

```
docker build -t parveen1992/m11extraparveen .
```

And version v1 also

```
docker build -t parveen1992/m11extraparveen:v1 .
```


## OK we start docker

HERE i use advance version.

and we start datach because of server.

```
docker run -p 110:110 -p 995:995 --rm --name popserver -h popserver --net popnet -d parveen1992/m11extraparveen:v1
```




## check point aws


**aws check if server runninng in correct prt**

```
[root@ip-172-31-20-221 examDocker]# docker network inspect popnet

```

so we find here ip address

```
"IPv4Address": "172.22.0.2/16",
```

```
[root@ip-172-31-20-221 examDocker]# nmap 172.22.0.2

Starting Nmap 7.60 ( https://nmap.org ) at 2019-06-06 09:04 UTC
Nmap scan report for ip-172-22-0-2.eu-west-2.compute.internal (172.22.0.2)
Host is up (0.000019s latency).
Not shown: 998 closed ports
PORT    STATE SERVICE
110/tcp open  pop3
995/tcp open  pop3s
MAC Address: 02:42:AC:16:00:02 (Unknown)

Nmap done: 1 IP address (1 host up) scanned in 1.52 seconds
```

check port of localhost

```
[root@ip-172-31-20-221 examDocker]# nmap localhost

Starting Nmap 7.60 ( https://nmap.org ) at 2019-06-06 09:05 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.0000070s latency).
Other addresses for localhost (not scanned): ::1
Not shown: 997 closed ports
PORT    STATE SERVICE
22/tcp  open  ssh
110/tcp open  pop3
995/tcp open  pop3s

Nmap done: 1 IP address (1 host up) scanned in 1.60 seconds
```


## check piont in host of classroom

**we check all mail of pop server as host de classroom**

#### check mail pere by pop

```
[isx0276204@i03 ~]$ telnet 3.8.122.202 110
Trying 3.8.122.202...
Connected to 3.8.122.202.
Escape character is '^]'.
+OK POP3 popserver 2007f.104 server ready
USER pere
+OK User name accepted, password please
PASS pere
+OK Mailbox open, 2 messages
LIST
+OK Mailbox scan listing follows
1 216
2 136
.
RETR 1
+OK 216 octets
Received: from ... by ... with ESMTP;
Subject: Prueba
From: <build.9.0.2416@ixazon.dynip.com>
To: <junkdtectr@carolina.rr.com>
Status:  O

>Desde el principio de los tiempos, la gente ha escrito cartas. pere1
.
```


#### check mail of marta by pops


```
[isx0276204@i03 ~]$ openssl s_client -connect 3.8.122.202:995
CONNECTED(00000003)
depth=0 C = --, ST = SomeState, L = SomeCity, O = SomeOrganization, OU = SomeOrganizationalUnit, CN = localhost.localdomain, emailAddress = root@localhost.localdomain
verify error:num=18:self signed certificate
verify return:1
depth=0 C = --, ST = SomeState, L = SomeCity, O = SomeOrganization, OU = SomeOrganizationalUnit, CN = localhost.localdomain, emailAddress = root@localhost.localdomain
verify return:1
---
Certificate chain
 0 s:/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=localhost.localdomain/emailAddress=root@localhost.localdomain
   i:/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=localhost.localdomain/emailAddress=root@localhost.localdomain
---
Server certificate
-----BEGIN CERTIFICATE-----
MIIETjCCAzagAwIBAgIJAKvS9haOQbVlMA0GCSqGSIb3DQEBCwUAMIG7MQswCQYD
VQQGEwItLTESMBAGA1UECAwJU29tZVN0YXRlMREwDwYDVQQHDAhTb21lQ2l0eTEZ
MBcGA1UECgwQU29tZU9yZ2FuaXphdGlvbjEfMB0GA1UECwwWU29tZU9yZ2FuaXph
dGlvbmFsVW5pdDEeMBwGA1UEAwwVbG9jYWxob3N0LmxvY2FsZG9tYWluMSkwJwYJ
KoZIhvcNAQkBFhpyb290QGxvY2FsaG9zdC5sb2NhbGRvbWFpbjAeFw0xOTA2MDYw
NzM0MDlaFw0yMDA2MDUwNzM0MDlaMIG7MQswCQYDVQQGEwItLTESMBAGA1UECAwJ
U29tZVN0YXRlMREwDwYDVQQHDAhTb21lQ2l0eTEZMBcGA1UECgwQU29tZU9yZ2Fu
aXphdGlvbjEfMB0GA1UECwwWU29tZU9yZ2FuaXphdGlvbmFsVW5pdDEeMBwGA1UE
AwwVbG9jYWxob3N0LmxvY2FsZG9tYWluMSkwJwYJKoZIhvcNAQkBFhpyb290QGxv
Y2FsaG9zdC5sb2NhbGRvbWFpbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoC
ggEBAMZvV2K+OaI/KelK3bEfrZ55vi33I3oTDVSP1PjKwgxpvA0PgspXOxKDI1uv
/uQb+EHcYj1rxskspu77lOtavsUjdIjgttQUCDllVeqjVRhh95f59dgYQnYQDdsw
uKSWNPq2wGPwNloddlB8O6X+MI9XrN0oqmLV1CJ8gKcMgNDKbI5gktH1acwSbIbA
0QAJn08YmbILS6j+J8xJW2NGMiQ2QaHiqJviacbvO67yDL7Upl4l0X5Szt5CNFor
Ps7bSRnk9vDigItJVtUPcTF8fMr2dslaDsmTR53+4paLYGumNjM6Pn7Z6f81x2c1
DpLzs13c0TEWewnY0IqvULcn+FcCAwEAAaNTMFEwHQYDVR0OBBYEFAii4JpKG8cL
2iy7R/lN+q1LISd8MB8GA1UdIwQYMBaAFAii4JpKG8cL2iy7R/lN+q1LISd8MA8G
A1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBALySJav1QwyEVmJOeDxY
OsDphefv0HwNQmqsxBRyjpM9JDeFuGkjgPLEdxoRK3rLPWQQ3NMjRtI9EjV82IDJ
lrs0Xn1lY4QKDprpnawENT385IdFsbedw2QPg4nwMyV7KNsRiJ7nvXRi0KXAoIGg
7fFZwTtdiI4YE34h+LfyrMlpFIQWeKvQAVkicgDdRx+99oTvzJGVwf2CVvftuphP
DsauJHPEuav/oE5V2WTO3bkWJS7v0AiydTF7+wl39P+eXs5qov9Vwcmp+/DO5HGU
35q37Oeayr6IW9FFWaKkDR9ANIjypu7/hNDvVhzXwtEMM++kZD5dLmNc0p/TGTBe
8EY=
-----END CERTIFICATE-----
subject=/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=localhost.localdomain/emailAddress=root@localhost.localdomain
issuer=/C=--/ST=SomeState/L=SomeCity/O=SomeOrganization/OU=SomeOrganizationalUnit/CN=localhost.localdomain/emailAddress=root@localhost.localdomain
---
No client certificate CA names sent
Peer signing digest: SHA512
Server Temp Key: X25519, 253 bits
---
SSL handshake has read 1731 bytes and written 347 bytes
Verification error: self signed certificate
---
New, TLSv1.2, Cipher is ECDHE-RSA-AES256-GCM-SHA384
Server public key is 2048 bit
Secure Renegotiation IS supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
SSL-Session:
    Protocol  : TLSv1.2
    Cipher    : ECDHE-RSA-AES256-GCM-SHA384
    Session-ID: 639045E885AF319772C4915D2B61724BDEE541FF3E63940A2DA9CFB8E6928734
    Session-ID-ctx: 
    Master-Key: E4655B3628247B7361C7510E2199A907116C84BAF642E11D6021B833AE4A191F7A5A630F1CFC085907880F0A9DDD4F52
    PSK identity: None
    PSK identity hint: None
    SRP username: None
    TLS session ticket lifetime hint: 7200 (seconds)
    TLS session ticket:
    0000 - 6e 10 c4 27 71 e2 0f ee-90 f5 4e db 3b 2e b1 f6   n..'q.....N.;...
    0010 - 26 95 3c 60 fd 07 79 4a-a7 69 0c a8 81 e9 e4 82   &.<`..yJ.i......
    0020 - cd 54 f7 fa a8 55 00 47-5b 64 8e bd 94 23 59 cb   .T...U.G[d...#Y.
    0030 - 1f 19 c5 29 d3 8f 82 9b-6f c0 97 45 cf 36 68 be   ...)....o..E.6h.
    0040 - 75 1b 80 6a db fd 4d 33-0a 83 5d 3a 08 9a ca c7   u..j..M3..]:....
    0050 - 58 d8 4f f0 3e 93 64 ac-25 b4 a7 58 4a 15 ce 2e   X.O.>.d.%..XJ...
    0060 - b0 be ad 10 9e 63 fa cd-e6 ec 48 a1 23 7b 83 15   .....c....H.#{..
    0070 - 12 ac 12 99 8b f8 70 5a-c9 b0 ac ec 9b bd ab 11   ......pZ........
    0080 - 0f 85 6b 4f 7d 45 c0 26-99 2a db 8e 23 11 f0 64   ..kO}E.&.*..#..d
    0090 - 29 13 6a bf 63 ad e1 98-fb c5 ee c8 37 4f 0e 53   ).j.c.......7O.S

    Start Time: 1559812249
    Timeout   : 7200 (sec)
    Verify return code: 18 (self signed certificate)
    Extended master secret: yes
---
+OK POP3 popserver 2007f.104 server ready
USER marta
+OK User name accepted, password please
PASS marta
+OK Mailbox open, 1 messages
LIST
+OK Mailbox scan listing follows
1 215
.
RETR 1
RENEGOTIATING
depth=0 C = --, ST = SomeState, L = SomeCity, O = SomeOrganization, OU = SomeOrganizationalUnit, CN = localhost.localdomain, emailAddress = root@localhost.localdomain
verify error:num=18:self signed certificate
verify return:1
depth=0 C = --, ST = SomeState, L = SomeCity, O = SomeOrganization, OU = SomeOrganizationalUnit, CN = localhost.localdomain, emailAddress = root@localhost.localdomain
verify return:1

```
