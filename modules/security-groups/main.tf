resource "aws_security_group" "web_sg" {
    name = var.name
    description = "Allow HTTP, HTTPS, and SSh"
    vpc_id = var.vpc_id

    ingress {
        description = "Allow HTTP"
        from_port = 80
        to_port = 80 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Allow HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description = "Allow SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Optional : lock to your IP later
    }

    tags = {
        Name = var.name
    }
}