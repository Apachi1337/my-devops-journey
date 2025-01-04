# OverTheWire Bandit - Level 15 to Level 16
The password for this level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL/TLS encryption
# Solution
SSH into bandit 15 `bandit15@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
```
Similar to the previous level we use the `cat` command to view the current levels password:
```bash
cat /etc/bandit_pass/bandit15
```
We then connect to port `30001` on localhost over SSL/TLS using the following:
```bash
openssl s_client -connect localhost:30001
```

Once the connection is established, the output will be:
```bash
CONNECTED(00000003)
Can't use SSL_get_servername
depth=0 CN = SnakeOil
verify error:num=18:self-signed certificate
verify return:1
depth=0 CN = SnakeOil
verify return:1
---
Certificate chain
 0 s:CN = SnakeOil
   i:CN = SnakeOil
   a:PKEY: rsaEncryption, 4096 (bit); sigalg: RSA-SHA256
   v:NotBefore: Jun 10 03:59:50 2024 GMT; NotAfter: Jun  8 03:59:50 2034 GMT
---
...
```
Enter the password when it prompts for `bandit15`:
```bash
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
```

Once the correct password is entered, the password for `bandit16` will be returned:
```bash
kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
```
We then exit the session using `exit`.
# Key Learning Outcome
1. Gaining an understanding of how SSL/TLS encryption works and how to use openssl `s_client` to securely connect to services over encrypted channels.
2. Learning how to interact with services that require secure communication using SSL/TLS.
