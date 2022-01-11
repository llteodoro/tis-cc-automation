variable "amis" {
    type = map

    default = {
        "us-east-2" = "ami-001089eb624938d9f" 
        "us-east-1" = "ami-08e4e35cccc6189f4" 
        
    }
  
}

variable "cdir_blocks_acesso-ssh" {
    type = list(string)
    default = ["177.209.235.161/32","200.97.174.58/32"] 
}

variable "key_name" {
    type = map 
    default = {
        "us-east-2" = "terraform-aws-pub"
        "us-east-1" = "terraform-aws-us-east-1"
    }
}

variable "instance" {
    type = map
    default = {
        "us-east-2" = "t2.micro"
        "us-east-1" = "t2.micro"
    }
}  