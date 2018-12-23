resource "aws_key_pair" "mykeypair" {
  key_name = "bastion-vpc"
  public_key = "ssh-rsa xxxxxxxxxxxxxxxxxxx"
}