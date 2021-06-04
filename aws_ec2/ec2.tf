resource "aws_instance" "ondemand" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_public.id
  vpc_security_group_ids      = [aws_security_group.sg_ssh.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.local_key.key_name
  user_data_base64            = filebase64(var.user_data_raw)
  count                       = var.ec2_market_type == "spot" ? 0 : 1

  tags = {
    Name = "terraformed-ondemand"
  }
}

resource "aws_spot_instance_request" "spotted" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_public.id
  vpc_security_group_ids      = [aws_security_group.sg_ssh.id]
  associate_public_ip_address = true
  spot_price                  = data.aws_ec2_spot_price.my.spot_price
  spot_type                   = "one-time"
  wait_for_fulfillment        = true
  key_name                    = aws_key_pair.local_key.key_name
  user_data_base64            = filebase64(var.user_data_raw)
  count                       = var.ec2_market_type == "spot" ? 1 : 0

  tags = {
    Name = "terraformed-spotted"
  }
}
