resource "aws_instance" "example" {
        count = 2
  ami           = data.aws_ami.amazon_linux.id
subnet_id = "subnet-0ba43e54dc640ac9d"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld-${count.index + 1}"
  }
}
