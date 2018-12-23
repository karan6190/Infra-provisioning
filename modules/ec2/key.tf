resource "aws_key_pair" "mykeypair" {
  key_name = "${var.VPC_NAME}-vpc"
  public_key = "${var.pubkey}"
}