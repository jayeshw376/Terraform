# Define the IAM Role for EC2
resource "aws_iam_role" "ec2_admin_role" {
  name = "ec2-admin-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach the AWS Managed "AdministratorAccess" Policy
resource "aws_iam_role_policy_attachment" "admin_access_attachment" {
  role       = aws_iam_role.ec2_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# Create an Instance Profile for the EC2 IAM Role
resource "aws_iam_instance_profile" "ec2_admin_instance_profile" {
  name = "ec2-admin-instance-profile"
  role = aws_iam_role.ec2_admin_role.name
}



# EC2 Instance
resource "aws_instance" "example" {
    ami           = "ami-07b2fe5d6ba52171e"
    instance_type = "t2.micro"
    key_name = "strike7620"
    iam_instance_profile = aws_iam_instance_profile.ec2_admin_instance_profile.name
    tags={
        Name = "example"
    }
}