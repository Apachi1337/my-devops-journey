# OverTheWire Bandit - Level 16 to Level 17
For this level our task is to locate and retrieve the password for bandit17 by using nmap to identify open ports and then accessing the SSL/TLS service to obtain the password.
# Solution
SSH into bandit 16 `bandit16@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
```
Our task is to locate and retrieve the password for bandit17 by using nmap to identify open ports and then accessing the SSL/TLS service to obtain the password.
```bash
nmap localhost -p 31000 – 32000
```
This then returned 5 open ports:
```bash
Starting Nmap 7.94SVN ( https://nmap.org ) at 2024-12-29 21:59 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00032s latency).
Not shown: 996 closed tcp ports (conn-refused)
PORT      STATE SERVICE
31046/tcp open  unknown
31518/tcp open  unknown
31691/tcp open  unknown
31790/tcp open  unknown
31960/tcp open  unknown
```
I tried connecting to all of them to see which one would return the password. I used:
```bash
openssl s_client -connect localhost:31790
```
but the only ports that connected over SSL/TLS were ports `31790` and `31518`. However that still didn't give me the answer I was looking for as it wouldn't show me the RSA private key. It kept giving me `KEYUPDATE` as a response. I tried a an alternative, `socat`. I used the following command;

```bash
Echo “kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx” | socat – OPENSSL:localhost:31790,verify=0
```
The `OPENSSL:localhost:31790,verify=0` is the connection using SSL/TLS to the port you specify on the localhost. `verify=0` just disables the certificate verification. 
This gave me the RSA private key I was looking for:

```bash
kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----
```

We then created a temp directory in `/tmp` called `game16`. Created a file in there called `ssh_key17` where I copied the contents of the private key into it. Make it secure by changing the permissions to read only using `chmod 400`
```bash
chmod 400 ssh_key17
```

Log into `bandit17` via ssh

```bash
ssh -i ssh_key17 bandit17@bandit.labs.overthewire.org -p 2220
```
# Key Learing Outcome
1. Understanding the use of `echo` in combination with openssl to automate the process of sending data securely.
2. Learning how to use nc to scan a range of ports and identify which ones have active services running.
3. Understanding file permissions and how to set them correctly using `chmod` for security-sensitive files like SSH keys.

