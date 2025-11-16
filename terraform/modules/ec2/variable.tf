variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "sg_id" {
  type = string
}

variable "name" {
  type = string
}


variable "public_key_path" {
    type = string
  
}