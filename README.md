# 🌐 Terraform Static Website

## 🚀 Project Overview

This project deploys a static website infrastructure on AWS using **Terraform**. It follows production-ready practices and includes:

- Custom VPC with public subnet  
- Internet Gateway and Route Tables  
- Security Group for web access  
- EC2 instance to host a static site  
- Application Load Balancer (ALB)  
- HTTPS via ACM SSL certificate  
- Auto Scaling Group for high availability  
- Route 53 domain and DNS record  

---

## 🛠 Tools Used

- Terraform  
- AWS (EC2, VPC, ALB, ACM, Route 53)  
- Git & GitHub  
- Visual Studio Code  

---

## 📁 Project Structure

```
Terraform-Static-Website/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── versions.tf
└── README.md
```

---

## ⚙️ How to Use

1. **Clone the repository:**

   ```bash
   git clone https://github.com/JBoyle-C/Terraform-Static-Website.git
   cd Terraform-Static-Website
   ```

2. **Initialize Terraform:**

   ```bash
   terraform init
   ```

3. **Preview changes:**

   ```bash
   terraform plan
   ```

4. **Apply infrastructure:**

   ```bash
   terraform apply
   ```

5. **Visit your site:**  
   After deployment, access your static website via the domain you configured in Route 53.

---

## ❌ Clean Up

To destroy all resources and avoid charges:

```bash
terraform destroy
```

---

## ✅ Real-World Use Case

This project simulates how a real company might deploy a high-availability static website with:

- TLS encryption  
- Load balancing  
- Infrastructure as code  
- DNS automation  

It demonstrates core cloud and DevOps skills needed for cloud engineering roles.

---

## © License

MIT License — free for personal and commercial use.
