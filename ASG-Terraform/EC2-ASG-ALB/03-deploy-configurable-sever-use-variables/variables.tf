variable "region" {
	description = " it will define the AWS region "
	default = "us-east-1"
}
variable "server_port" {
	description = " http service listen on ths port "
	default = "80"
}

variable "ssh_port" {
	description = "ssh request to server  "
	default = "22"
}
variable "instance_type" { 
	description = "AWS ec2 instance type"
	default="t3.micro"
}
variable "my_public_ip" {
	description = "My local system public IP ..." 
        default = "223.185.42.146/32"
}
variable "ami" {
description = "amazon machine image"
default = "ami-0a313d6098716f372"
}
