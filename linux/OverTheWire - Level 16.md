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
but the only ports that connected over SSL/TLS were ports `31790` and `31518`. However that still didn't give me the answer I was looking for as it wouldn't show me the RSA private key. It kept giving me `KEYUPDATE` as a response.

