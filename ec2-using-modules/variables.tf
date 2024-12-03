variable "ami" {
    type        = string
    description = "The ID of the AMI to use for the instance"
    default = ""
  
}
variable "instance_type" {
    type        = string
    description = "The type of instance to start"
    default = ""
  
}
variable "key_name" {
    type        = string
    description = "The key name to use for the instance"
    default = ""
}

variable "ec2-name" {
    type        = string
    description = "The name of the EC2 instance"
    default = ""
  
}
variable "availability_zone" {
    type = string
    default = ""
  
}