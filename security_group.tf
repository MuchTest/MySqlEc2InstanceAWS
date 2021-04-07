resource "aws_security_group" "allow_ports" {

  name        = "allow_ports"
  description = "inbound and outbound traffic"


  ingress {
    from_port   = 22
    to_port     = 22 
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 33060
    to_port   = 33060
    protocol  = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "6"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 80
    to_port         = 80
    protocol        = "6"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  vpc_id = var.uvpc

}
