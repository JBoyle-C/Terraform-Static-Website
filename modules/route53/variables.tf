variable "hosted_zone_id" {
    description = "Hosted Zone ID in Route 53"
    type = string
}

variable "record_name" {
    description = "Domain name (e.g. www.example.com) The DNS Name to register"
    type = string 
}

variable "alb_dns_name" {
    description = "ALB DNS name to alias"
    type = string 
}

variable "alb_zone_id" {
    description = "ALB's zone ID for aliasing"
    type = string
}