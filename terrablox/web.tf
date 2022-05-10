#Create security group with firewall rules
resource "aws_security_group" "terra_security_group" {
  name        = "terra_security_port"
  description = "security group for web ec2"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags= {
    Name = "security_ports"
  }
}

resource "aws_instance" "terraform_ec2" {
  ami             = "ami-01c592dda54e43c1a"
  count           = 1
  key_name        = "ca-central-1-terraform-ec2"
  instance_type   = "t2.micro"
  security_groups = [ aws_security_group.terra_security_group.name ]
  tags= {
    Name = "web"
  }
}