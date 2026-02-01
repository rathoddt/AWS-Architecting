resource "aws_elb" "my_first_elb" {
    name = "tf-elb-v2"
    # availability_zones = var.azs
    # subnets         = data.aws_subnets.all.ids
    subnets = data.aws_subnets.supported.ids
    security_groups=[ aws_security_group.elb_sg.id ]
    listener {
        lb_port=80
        lb_protocol ="http"
        instance_port = var.server_port
        instance_protocol= "http"
    }
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 3
        timeout=3
        interval = 30
        target = "HTTP:${var.server_port}/"
    }
}


