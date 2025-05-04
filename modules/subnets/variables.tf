variable "vpc_id" {
    type = string
    description = "VPC ID for the subnet"
}

variable "cidr_block" {
    type = string 
    description = "CIDR block for the subnet"
}

variable "az" {
    description = "Availability Zone"
}

variable "name" {
    type = string
    description = "Name tag for the subnet"
}