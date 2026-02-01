variable "region" {
  default = "us-east-1"
}

variable "server_port" {
  default = 80
}

variable "ssh_port" {
  default = 22
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami" {
  default = "ami-0a313d6098716f372" # Ubuntu
}

variable "my_public_ip" {
  default = "223.185.36.141/32"
}

variable "allowed_azs" {
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1f"]
}
