resource "tls_private_key" "rsa4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "privatekey" {
  sensitive_content = tls_private_key.rsa4096.private_key_pem
  filename          = "${path.module}/${var.sshkey_name}"
  file_permission   = "0600"
}

resource "aws_key_pair" "local_key" {
  key_name   = var.sshkey_name
  public_key = tls_private_key.rsa4096.public_key_openssh
}
