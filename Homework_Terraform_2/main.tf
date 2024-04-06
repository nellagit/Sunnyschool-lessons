locals {
    instance_prefix = "MyEC2"
}
    
data "aws_ssm_parameter" "ami_parameter" {
  name = var.ami_parameter_name
}
resource "aws_launch_template" "MyLaunch_template" {
  name_prefix = var.name_prefix
  image_id    = data.aws_ssm_parameter.ami_parameter.value

  block_device_mappings {
    device_name = var.device_name

    ebs {
      volume_size = var.volume_size
    }
  }

  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = true
    subnet_id = var.subnet_id
  }

  placement {
    availability_zone = var.availability_zone
  }
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  user_data = filebase64("${path.module}/script.sh")
}

resource "aws_instance" "web" {
    count = 3
  tags = {
    Name = format("${local.instance_prefix}-%s-%02d", var.environment, count.index + 1)
}
  launch_template {
    id      = aws_launch_template.MyLaunch_template.id
    version = "$Latest"
  }
}
