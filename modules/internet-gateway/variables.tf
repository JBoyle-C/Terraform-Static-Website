variable "vpc_id" {
    description = "The ID of the VPC to attach to the Internet Gateway to"
    type = string
}

variable "igw_name" {
    description = "Name tag for the internet Gateway"
    type = string
}