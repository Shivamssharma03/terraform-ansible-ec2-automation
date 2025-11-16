

# resource "aws_instance" "server" {
#   count         = var.instance_count
#   ami           = var.ami
#   instance_type = var.instance_type
#   key_name      = var.key_name

#   vpc_security_group_ids = [var.sg_id]

#   tags = {
#     Name = "${var.name}-${count.index}"
#   }
# }


resource "aws_instance" "shivi" {
  count = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "${var.name}-${count.index}"
  }
}