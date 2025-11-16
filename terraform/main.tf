provider "aws" {
  region = "ap-south-1"
}

##############################
# SECURITY GROUP MODULE
##############################
module "sg" {
  source  = "./modules/sg"
  sg_name = "devops-sg"
}

##############################
# EC2 MODULE - NGINX SERVER
##############################
module "ec2_nginx" {
  source           = "./modules/ec2"
  ami              = var.ami
  instance_type    = var.instance_type
  instance_count   = 1
  key_name         = var.key_name
  public_key_path  = var.public_key_path      # <-- FIXED (NO file())
  sg_id            = module.sg.sg_id
  name             = "nginx-server"
}

##############################
# EC2 MODULE - APACHE SERVER
##############################
module "ec2_apache" {
  source           = "./modules/ec2"
  ami              = var.ami
  instance_type    = var.instance_type
  instance_count   = 1
  key_name         = var.key_name
  public_key_path  = var.public_key_path      
  sg_id            = module.sg.sg_id
  name             = "apache-server"
}

##############################
# ANSIBLE INVENTORY GENERATION
##############################
data "template_file" "inventory" {
  template = file("${path.module}/ansible_inventory.tpl")

  vars = {
    nginx_ip   = module.ec2_nginx.public_ips[0]
    apache_ip  = module.ec2_apache.public_ips[0]
    privatekey = var.private_key_path
  }
}

resource "local_file" "inventory" {
  content  = data.template_file.inventory.rendered
  filename = "../ansible/inventory.ini"
}

##############################
# RUN ANSIBLE AFTER EC2 CREATION
##############################
resource "null_resource" "run_ansible" {
  depends_on = [
    module.ec2_nginx,
    module.ec2_apache,
    local_file.inventory
  ]

  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -i inventory.ini install_nginx.yaml && ansible-playbook -i inventory.ini install_apache.yaml"
  }
}
