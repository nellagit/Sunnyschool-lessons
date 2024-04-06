resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"

  tags = {
    Name = "MyEc2-${count.index+1}"
  }
}