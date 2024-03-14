resource "aws_instance" "terraform_ec2" {
  ami             = "ami-01c592dda54e43c1a"
  count           = 1
  key_name        = "cineviewhost"
  instance_type   = "t2.micro"
  security_groups = [ aws_security_group.terra_security_group.name ]
  tags= {
    Name = "web"
  }
}