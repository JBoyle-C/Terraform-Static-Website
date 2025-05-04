variable "name" {
    description = "Base name for ASG resources"
    type = string
}

variable "ami_id" {
    description = "AMI for EC2 instances"
    type = string
}

variable "instance_type" {
    description = "EC2 Instance type"
    type = string
}

variable "security_group_id" {
    description = "Security Group ID"
    type = string
}

variable "subnet_ids" {
    description = "Subnets to launch instances in"
    type = list(string)
}

variable "target_group_arn" {
    description = "Target group for ALB registration"
}

variable "user_data" {
    description = "Base64-encoded user data"
    type = string
}

variable "key_name" {
    description = "Key pair name for EC2 instances"
    type = string
}