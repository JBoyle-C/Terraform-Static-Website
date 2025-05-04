variable "vpc_id" {
    type = string
    description = "The VPC ID"
}

variable "igw_id" {
    type = string
    description = "The Internet Gateway ID"
}

variable "subnet_id" {
    description = "The Subscription ID to associate"
}

variable "name" {
    type = string
    description = "Name tag for the Route Table"
}