resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    associate_public_ip_address = true
    key_name = var.key_name

    user_data = file ("${path.module}/user-data.sh")
    
    tags = {
        Name = var.name
    }
}