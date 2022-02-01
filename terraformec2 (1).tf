provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "myec2" {
  depends_on = [aws_db_instance.default]
  ami           = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  subnet_id   = "subnet-0ad08acb398ada09d"
  key_name = "sshkey1"
  user_data = templatefile("${path.module}/userdata.tftpl", {endpoint = aws_db_instance.default.endpoint,password = aws_db_instance.default.password,address = aws_db_instance.default.address})
  iam_instance_profile = "demo-Role"
  security_groups = ["sg-017c097bb1674f881"]
  tags = {
    Name = "cpms2"
  }
}
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "cpms"
  identifier           = "myrdb2"
  username             = "admin"
  password             = "ramana4u2021"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
  vpc_security_group_ids = ["sg-017c097bb1674f881"]
}
resource "aws_launch_configuration" "as_conf" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
  security_groups    = var.security_groups
  user_data = "${file("userdata.sh")}"
}
resource "aws_autoscaling_group" "bar" {
  name                 = var.name 
  depends_on           = ["aws_launch_configuration.as_conf"]
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 1
  max_size             = 2
  desired_capacity     = 1
  target_group_arns   = [var.target_group_arns]
 availability_zones = var.availability_zones
}
resource "aws_lb" "test" {
  name               = var.name_lb
  internal           = false
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets
}
resource "aws_lb_target_group" "test" {
  name     = var.name_TG
  port     = 80
  protocol = var.protocol
  vpc_id   = var.vpc_id
}
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = var.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test.arn
  }
}
