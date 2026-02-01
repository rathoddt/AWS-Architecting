module "from-m-ec2"{
    source = "../modules/asg"
    instance_type = "t3.micro"   
}