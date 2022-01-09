provider "aws" {
    version = "~> 2.0"
    region = "us-east-2"
  
}

resource "aws_instance" "dev" {
    count = 3
    ami = "ami-056b1936002ca8ede"
    instance_type = "t2.micro"
    key_name = "terraform-aws-pub"
    tags = {
        Name = "dev${count.index}"
    }
    vpc_security_group_ids = ["sg-0bf9938db9769dbf5"]
}


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
