# Launch template for wordpress
resource "aws_launch_template" "wordpress-launch-template" {
  name                   = "wordpress-launch-template"
  instance_type          = "t2.micro"
  image_id               = var.ami
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

  provisioner "local-exec" {
    command = "powershell.exe ${path.module}/wordpress.sh ${aws_efs_access_point.wordpress.id} ${aws_efs_file_system.ACS-efs.id}"
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.ip.id
  }

  key_name = var.keypair

  placement {
    availability_zone = "random_shuffle.az_list.result"
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "wordpress-launch-template"
    }
  }

  user_data = filebase64("${path.module}/wordpress.sh")

}

# ---- Autoscaling for wordpress application
resource "aws_autoscaling_group" "wordpress-asg" {
  name                      = "wordpress-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2

  # Where you place in your subnet
  vpc_zone_identifier = [aws_subnet.private[0].id, aws_subnet.private[1].id]

  launch_template {
    id      = aws_launch_template.wordpress-launch-template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "ACS-wordpress"
    propagate_at_launch = true
  }

}

# attaching autoscaling group of wordpress to internal load balancer
resource "aws_autoscaling_attachment" "asg_attachment_wordpress" {
  autoscaling_group_name = aws_autoscaling_group.wordpress-asg.id
  lb_target_group_arn   = aws_lb_target_group.wordpress-tgt.arn
}

# launch template for tooling
resource "aws_launch_template" "tooling-launch-template" {
  name                   = "tooling-launch-template"
  instance_type          = "t2.micro"
  image_id               = var.ami
  vpc_security_group_ids = [aws_security_group.webserver-sg.id]

    provisioner "local-exec" {
    command = "powershell.exe ${path.module}/tooling.sh ${aws_efs_access_point.tooling.id} ${aws_efs_file_system.ACS-efs.id}"
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.ip.id
  }

  key_name = var.keypair

  placement {
    availability_zone = "random_shuffle.az_list.result"
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "tooling-launch-template"
    }
  }

  user_data = filebase64("${path.module}/tooling.sh")
}

# ---- Autoscaling for tooling 
resource "aws_autoscaling_group" "tooling-asg" {
  name                      = "tooling-asg"
  max_size                  = 2
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2

  # Where you place in your subnet
  vpc_zone_identifier = [aws_subnet.private[0].id, aws_subnet.private[1].id]

  launch_template {
    id      = aws_launch_template.tooling-launch-template.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = "ACS-tooling"
    propagate_at_launch = true
  }

}

# attaching autoscaling group of tooling application to internal loadbalancer
resource "aws_autoscaling_attachment" "asg_attachment_tooling" {
  autoscaling_group_name = aws_autoscaling_group.tooling-asg.id
  lb_target_group_arn   = aws_lb_target_group.tooling-tgt.arn
}