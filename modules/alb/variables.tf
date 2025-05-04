variable "name" {
    description = "Name for the ALB and resources"
    type = string
}

variable "vpc_id" {
    description = "VPC ID"
    type = string
}

variable "subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "instance_id" {
    description = "EC2 instance to register with the target group"
    type = string
}

variable "security_group_id" {
  description = "Security Group to attach to ALB"
  type        = string
}

variable "certificate_arn" {
  description = "ARN of the ACM SSL certificate"
}