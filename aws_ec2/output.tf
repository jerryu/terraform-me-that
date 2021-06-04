output "ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "spot_price" {
  value = data.aws_ec2_spot_price.my.spot_price
}

output "ec2_public_ip" {
  value = var.ec2_market_type == "spot" ? aws_spot_instance_request.spotted[0].public_ip : aws_instance.ondemand[0].public_ip
}

output "ssh_private_key_file" {
  value = local_file.privatekey.filename
}

output "myip" {
  value = data.http.myip.body
}
