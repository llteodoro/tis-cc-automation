provider "aws" {
    version = "~> 2.0"
    region = "us-east-2"
  
}

provider "aws" {
    alias = "us-east-1"
    version = "~> 2.0"
    region = "us-east-1"
  
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

resource "aws_instance" "dev6" {
    provider = aws.us-east-1
    ami = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"
    key_name = "terraform-aws-us-east-1"
    vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-1.id}"]
    tags = {
      Name = "dev6"    
    }
    depends_on = [aws_dynamodb_table.dynamodb-hml]
}


resource "aws_dynamodb_table" "dynamodb-hml" {
  provider = aws.us-east-1
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

}

resource "aws_s3_bucket" "dev4" {
    bucket = "terraform-aws-s3-dev4"
    acl = "private"

    tags = {
        Name = "terraform-aws-s3-dev4"
    }
} 
