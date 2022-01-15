terraform {
 backend "remote" {
    organization = "llteodoro"

    workspaces {
    name = "aws-alura-devops"
    }
   }
 }
