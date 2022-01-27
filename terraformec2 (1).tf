provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "myec2" {
  depends_on = [aws_db_instance.default]
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  subnet_id   = "subnet-0ad08acb398ada09d"
  key_name = "sshkey1"
  user_data = "templatefile("${path.module}/userdata.tftpl", {endpoint = aws_db.default.endpoint})"
  iam_instance_profile = "demo-Role"
  security_groups = ["sg-017c097bb1674f881"]
  tags = {
    Name = "Ec2tf"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "ramana4u2021"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
  security_group_names = ["sg-017c097bb1674f881"]
}
