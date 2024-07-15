# Using AWS as the provider for deploying resources to the AWS cloud
# Specify AWS access keys & uncomment the statements if the AWS CLI is not configured on the machine running the Terraform script

provider "aws" {
  region = "us-east-1"
  #access_key = "***"
  #secret_key = "***"
}   

resource "aws_vpc" "vpc-ansible-lab" {
cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "subnet-ansible-lab" {
  vpc_id = aws_vpc.vpc-ansible-lab.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1c"
}

resource "aws_instance" "Ansible-Controller-Node" {
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-ansible-lab.id
  ami = "ami-0b72821e2f351e396"
  key_name = "Ansible"
  associate_public_ip_address = true
  tags = {
    Name = "Ansible-Controller-Node"
  }
}
resource "aws_instance" "Ansible-Targer-Node-1" {
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-ansible-lab.id
  ami = "ami-0b72821e2f351e396"
  key_name = "Ansible"
  associate_public_ip_address = true
  tags = {
    Name = "Ansible-Targer-Node-1"
  }
}
resource "aws_instance" "Ansible-Targer-Node-2" {
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet-ansible-lab.id
  ami = "ami-0b72821e2f351e396"
  key_name = "Ansible"
  associate_public_ip_address = true
  tags = {
    Name = "Ansible-Targer-Node-2"
  }
}