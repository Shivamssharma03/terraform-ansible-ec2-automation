resource "aws_key_pair" "my_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

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
  key_name      = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [var.sg_id]

  tags = {
    Name = "${var.name}-${count.index}"
  }
}