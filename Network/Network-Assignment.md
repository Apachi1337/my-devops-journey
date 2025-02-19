# Setup Guide: Hosting NGINX with a Custom Domain on AWS

This guide walks you through setting up an **NGINX** web server on an **AWS EC2** instance and linking it to a **custom domain** registered via **Cloudflare** or **AWS Route 53**.
---

## 1. **Purchase a Domain** 
### Using Cloudfare
1. Sign up or login to [Cloudflare](https://www.cloudflare.com/).
2. Navigate to **Registrar** amd register a domain.

### **Using AWS Route 53**
1. Login to the [AWS Management Console](https://aws.amazon.com/console/).
2. Go to **Route 53** and purchase a domain.
---

## 2. **Launch an EC2 Instance**
1. in the AWS Console, navigate to **EC2 → Launch Instance**.
2. Configure your instance
   -  **AMI:** Select a Linux-based AMI (e.g., **Amazon Linux 2** or **Ubuntu**).
   -  **Instance Type:** Start with `t2.micro`.
   -  **Network Settings:** Ensure **public IP is enabled**
   -  **Security Group:** Allow **HTTP (port 80)  and SSH (port 22).**
3. Launch the instance and **download the private key file (`.pem`)** for SSH access.
---

## 3. **Install NGINX**
1. **SSH into your EC2 instance:**
  ```bash
  ssh -i your-key.pem ec2-user@your-ec2-public-ip

  ```
2. Update the instance and install NGINX:
   
**For Amazon Linux:**
```bash
sudo yum update -y
sudo yum install nginx -y
```

**For Ubuntu:**
```bash
sudo apt update
sudo apt install nginx -y
```

3. Start and enable NGINX:
```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

4. **Verify NGINX** is running by accessing your EC2's public IP in a browser:
```ccp
http://<your-ec2-public-ip>
```
---

## 4. **Configure DNS on Cloudflare**
1. **Add your domain to Cloudfare:**
     - Navigate to **Domains** and add your purchased domain.
     - Update your domain's **nameservers** to Cloudflare's.
2. **Create an A Record:**
     - Go to **DNS Settings.**
     - Add an **A record:**
          - **Name:** `nginx` (for `nginx.yourdomin.com`) or leave blank for the root domain.
          - **IPv4 Address:** Enter your EC2 instance's public IP.
     - Save and wait for **DNS Propagation** (this can take few minutes to a few hours).
  
---

## 5. Test Your Setup
- Open your browser and visit your domain:
  ```bash
  http://nginx.yourdomain.com
  ```
- You should see the default **NGINX Welcome Page**

  ![WhatsApp Image 2025-02-17 at 15 40 53_af516615](https://github.com/user-attachments/assets/7ea241d0-1377-45a4-9551-974b1b63b2fc)

---


