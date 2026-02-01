resource "aws_launch_template" "my_first_lt" {
  name_prefix   = "webserver-lt-"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = "terraform"

  vpc_security_group_ids = [aws_security_group.webserver_sg.id]

  user_data = base64encode(<<-EOF
    #!/bin/bash
    set -euxo pipefail

    exec > >(tee /var/log/user-data.log | logger -t user-data -s 2>/dev/console) 2>&1

    apt-get update -y
    apt-get install -y apache2 curl

    systemctl enable apache2
    systemctl start apache2

    INSTANCE_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4 || echo "NO_IP")

    echo "Hello world" > /var/www/html/index.html
    echo "<br>Instance IP: $INSTANCE_IP" >> /var/www/html/index.html
  EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "terraform-ws"
    }
  }
}
