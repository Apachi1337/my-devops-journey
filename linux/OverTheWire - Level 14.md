# OverTheWire Bandit - Level 14 to Level 15
The password for this level can be retrieved by submitting the password of the current level to port 30000 on localhost.
# Solution
SSH into bandit 14 using the SSH key `sshkey.private` we found in the previous level:
```bash
ssh -i sshkey.private bandit14@localhost -p 2220
```
Once in, I took a look at the current levels password:
```bash
cat /etc/bandit_pass/bandit14
```
This outputs:
```bash
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
```

We then connect to port `30000` using `nc`(netcat) command:
```bash
nc localhost 30000
```
This opens a connection to port `30000` on `localhost`. Once connected, it will ask for the current levels password which you enter:

```bash
MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
```

After inputting the correct password, we get the password for `bandit15`
```bash
8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
```
# Key Learning Outcome
1. Understanding how to use `nc` (Netcat) to connect to specific network ports and interact with remote services.
2. Gaining familiarity with basic networking concepts, such as communicating with services over specific ports.
