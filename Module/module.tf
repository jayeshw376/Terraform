module "ec2-instance" {
    source = "../ec2-using-modules"
    ami = "ami-0c94855ba95c71c99"
    instance_type = "t2.micro"
    key_name = ""
    ec2-name = ""
    availability_zone = ""
  
}