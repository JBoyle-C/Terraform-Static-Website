variable "ami_id" {
    description = "AMI ID to use"
    type = string
}

variable "instance_type" {
    description = "EC2 instance type"
    type = string
}

variable "subnet_id" {
    description = "Subnet ID to launch the instance in"
    type = string
}

variable "security_group_id" {
    description = "Security Group ID to attach"
    type = string
}

variable "key_name" {
    description = "EC2 Key Pair name for SSH access"
    type = string
}

variable "name" {
    description = "Name tag of for the EC2 instance"
    type = string
}