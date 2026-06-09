resource "aws_instance" "example" {
        count = 2
  ami           = "data.aws_ami.ubuntu.id"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
