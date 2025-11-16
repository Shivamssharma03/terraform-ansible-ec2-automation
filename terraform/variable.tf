variable "key_name" {
  type        = string
  description = "AWS key pair name"
}

variable "private_key_path" {
  type        = string
  description = "Path to your SSH private key on Windows"
}

variable "instance_type" {

    type = string
  
}


variable "ami" {
    type = string
  
}




variable "Name" {
  description = "Name of the project"
  type        = string
}


variable"public_key_path"{
    type = string
} 

