resource "aws_instance" "apache2-instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.ec2-security-group.name]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install apache2 -y
              systemctl start apache2
              systemctl enable apache2
              # Removing custom HTML and serving default Apache2 Ubuntu page
              EOF

  tags = {
    Name = "Apache2-Instance"
  }
}



