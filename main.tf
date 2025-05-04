module "vpc" {
  source   = "./modules/vpc"
  vpc_name = "StaticWebsiteVPC"
  vpc_cidr = "10.0.0.0/16"
}

module "igw" {
  source   = "./modules/internet-gateway"
  vpc_id   = module.vpc.vpc_id
  igw_name = "StaticWebsiteIGW"
}

module "public_subnet_1a" {
  source     = "./modules/subnets"
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.0.0/16"
  az         = "us-east-a1"
  name       = "PublicSubnet-1a"
}

module "public_route_table" {
  source    = "./modules/route-tables"
  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.public_subnet_1a.subnet_id
  name      = "PublicRouteTable"

}

module "web_sg" {
  source = "./modules/security-groups"
  name   = "WebSecurityGroup"
  vpc_id = module.vpc.vpc_id
}

module "ec2_web" {
  source            = "./modules/ec2"
  ami_id            = "ami-0c101f26f147fa7fd "
  instance_type     = "t2.micro"
  subnet_id         = module.public_subnet_1a.subnet_id
  security_group_id = module.web_sg.security_group_id
  key_name          = "your-key-name" # Change this to match your actual EC2 Key Pair
  name              = "WebEC2Instance"
}



module "acm" {
  source      = "./modules/acm"
  domain_name = "yourdomain.com" # Replace with your real domain name
  # Note, ACM Certificates must be in the us-east-1 region if you're using them with CloudFront (Not our case yet, but keep that in mind.)

}

module "alb" {
  source            = "./modules/alb"
  name              = "WebALB"
  vpc_id            = module.vpc.vpc_id
  subnet_ids        = [module.public_subnet_1a.subnet_id]
  security_group_id = module.web_sg.security_group_id
  instance_id       = module.ec2_web.instance_id
  certificate_arn   = module.acm.certificate_arn
}

module "route53_record" {
  source         = "./modules/route53"
  hosted_zone_id = "Z123456EXAMPLE" # Placeholder hosted zone ID
  record_name    = "example.local"  #Simulated domain
  alb_dns_name   = module.alb.alb_dns_name
  alb_zone_id    = module.alb.alb_zone_id
}
module "web_asg" {
  source            = "./modules/asg"
  name              = "Web"
  ami_id            = "ami-0c101f26f147fa7fd"
  instance_type     = "t2.micro"
  key_name          = "your-key-name"
  security_group_id = module.web_sg.security_group_id
  subnet_ids        = [module.public_subnet_1a.subnet_id]
  target_group_arn  = module.alb.web_tg_arn
  user_data         = base64encode(file("scripts/user_data.sh"))
}

module "sns" {
  source = "./modules/sns"
  name = "WebApp"
  autoscaling_group_name = module.web_asg.asg_name
}