resource "aws_launch_template" "web_lt" {
  name_prefix   = "web-lt-"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = "terraform"

  vpc_security_group_ids = [aws_security_group.webserver_sg.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    set -eux
    apt-get update -y
    apt-get install -y apache2
    systemctl enable apache2
    systemctl start apache2
    echo "Hello from ALB + ASG" > /var/www/html/index.html
  EOF
  )
}
