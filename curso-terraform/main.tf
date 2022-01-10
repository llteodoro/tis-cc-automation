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
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
    count = 1
    ami = "ami-056b1936002ca8ede"
    instance_type = "t2.micro"
    key_name = "terraform-aws-pub"
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    depends_on = [aws_s3_bucket.dev4]
    tags = {
        Name = "dev4"
    }
}

resource "aws_instance" "dev5" {
    #count = 3
    ami = "ami-056b1936002ca8ede"
    instance_type = "t2.micro"
    key_name = "terraform-aws-pub"
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
    tags = {
      Name = "dev5"
    }
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

resource "aws_s3_bucket" "dev4" {
    bucket = "terraform-aws-s3-dev4"
    acl = "private"

    tags = {
        Name = "terraform-aws-s3-dev4"
    }
} 
