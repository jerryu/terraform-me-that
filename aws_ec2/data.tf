data "aws_ami" "ubuntu" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ec2_spot_price" "my" {
  instance_type     = var.instance_type
  availability_zone = "${var.region}a"

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}

data "http" "myip" {
  url = "https://api.ipify.org/"
}
