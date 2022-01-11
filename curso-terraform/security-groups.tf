resource "aws_security_group" "acesso-ssh" {
    name = "terraform-aws-ssh"
    description = "terraform-aws-ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = var.cdir_blocks_acesso-ssh   
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
        cidr_blocks = var.cdir_blocks_acesso-ssh 
} 

  tags = {
    Name = "acesso-ssh"
  }
}
