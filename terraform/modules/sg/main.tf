
data "aws_vpc" "default" {
  default = true
}
resource "aws_security_group" "this" {
  name        = var.sg_name
  vpc_id = data.aws_vpc.default.id
  description = "Security group created from module"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
