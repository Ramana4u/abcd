provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "myec2" {
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  subnet_id   = "subnet-0ad08acb398ada09d"
  key_name = "sshkey1"
  user_data = "${file("userdata.sh")}"
  security_groups = ["sg-017c097bb1674f881"]
  tags = {
    Name = "Ec2tf"
  }
}
