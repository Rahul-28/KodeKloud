resource "tls_private_key" "devops-kp" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_sensitive_file" "pem_file" {
    filename = "/home/bob/devops-kp.pem"
    content = tls_private_key.devops-kp.private_key_pem
    file_permission = "0600"
}

resource "aws_key_pair" "devops-kp" {
    key_name = "devops-kp"
    public_key = tls_private_key.devops-kp.public_key_openssh
}