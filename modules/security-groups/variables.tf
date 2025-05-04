variable "name" {
    description = "Name tag for the security group"
    type = string
}

variable "vpc_id" {
    description = "The VPC ID to associate the security group with"
    type = string
}