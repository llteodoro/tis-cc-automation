resource "aws_security_group" "acesso-ssh" {
    name = "terraform-aws-ssh"
    description = "terraform-aws-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["177.209.235.161/32"]  
} 

  tags = {
    Name = "acesso-ssh"
  }
}

resource "aws_security_group" "acesso-ssh-us-east-1" {
    provider = aws.us-east-1
    name = "terraform-aws-ssh"
    description = "terraform-aws-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["177.209.235.161/32"]  
} 

  tags = {
    Name = "acesso-ssh"
  }
}
