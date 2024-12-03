# key pair
resource "aws_key_pair" "name" {
    key_name   = "terra"
    public_key = file("~/.ssh/id_ed25519.pub")
    
  
}
# ec2
resource "aws_instance" "example" {
    ami           = "ami-07b2fe5d6ba52171e"
    instance_type = "t2.micro"
    key_name = aws_key_pair.name.key_name
    
    tags={
        Name = "example"
    }
}