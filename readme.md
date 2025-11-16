
# Terraform + Ansible Automated EC2 Deployment

<div align="left">
  <img src="https://img.shields.io/badge/Terraform-Automation-844FBA?logo=terraform" alt="Terraform Badge">
  <img src="https://img.shields.io/badge/Ansible-Configuration%20Management-EE0000?logo=ansible" alt="Ansible Badge">
  <img src="https://img.shields.io/badge/AWS-EC2%20Deployment-FF9900?logo=amazon-aws" alt="AWS Badge">
  <img src="https://img.shields.io/badge/Ubuntu-24.04%20LTS-E95420?logo=ubuntu" alt="Ubuntu Badge">
  <img src="https://img.shields.io/badge/DevOps-End%20to%20End%20Automation-0A66C2" alt="DevOps Badge">
  <img src="https://img.shields.io/badge/License-MIT-green" alt="License Badge">
</div>



This repository contains an automated DevOps workflow that provisions EC2 instances using **Terraform**, then automatically installs and configures **Nginx**, **Apache**, **Node.js 20**, and **PM2** using **Ansible**.

---

## 🚀 Project Overview

### Technologies Used
- **Terraform** – Infrastructure provisioning (EC2, Security Groups, Key Pair)
- **Ansible** – Configuration management & software installation
- **AWS EC2** – Two servers (nginx + apache)
- **Ubuntu 24.04** – OS for EC2 instances
- **WSL (Ubuntu)** – Local environment for Terraform & Ansible

---

## 📁 Project Structure

```
terraform-ansible-ec2-automation/
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   ├── modules/
│   │   ├── ec2/
│   │   │   ├── main.tf
│   │   │   ├── variables.tf
│   │   └── sg/
│   │       ├── main.tf
│   │       ├── variables.tf
│   └── ansible_inventory.tpl
│
└── ansible/
    ├── inventory.ini
    ├── install_nginx.yaml
    ├── install_apache.yaml
```

---

## 🛠 Features

- Auto-create EC2 instances  
- Install Nginx on server 1  
- Install Apache on server 2  
- Install Node.js 20 + PM2 on both servers  
- Fully automated Terraform → Ansible pipeline  
- Dynamic inventory file generation  
- Zero-click installation after `terraform apply`

---

## ⚙️ How It Works

### 🔹 1. Terraform:
- Creates AWS Key Pair  
- Creates Security Group  
- Launches two EC2 instances  
- Generates Ansible dynamic inventory file  

### 🔹 2. Ansible:
- SSH into both servers  
- Installs:
  - Nginx / Apache  
  - Node.js 20  
  - npm  
  - pm2  

### 🔹 3. Full Automation:
Terraform triggers Ansible automatically using:

```bash
null_resource + local-exec
```

---

## ▶️ Usage

### Initialize Terraform
```bash
`terraform init`
```


### Validate
```bash
`terraform validate`
```


### Apply
```bash
`terraform apply -auto-approve`
```

---

## 🔐 SSH Access

```bash
`ssh -i ~/.ssh/id_rsa ubuntu@PUBLIC_IP`
```

---

## 📜 Run Playbooks Manually

### Install Nginx
```bash
`ansible-playbook -i inventory.ini install_nginx.yaml`
```

### Install Apache
```bash
`ansible-playbook -i inventory.ini install_apache.yaml`
```

---

## 📦 Requirements

- Terraform v1.5+  
- Ansible 2.14+  
- AWS CLI configured  
- Ubuntu WSL recommended  

---

## 🧑‍💻 Author
**Shivam Sharma**  
DevOps Engineer  

---

## ⭐ Support
If this project helped you —  
please ⭐ **star the repository**!

---
