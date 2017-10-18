resource "aws_instance" "buildServers"
{
ami = "ami-9fa761e7"
instance_type = "t2.micro"
count = "3"
vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
key_name = "mysql-key"
subnet_id="${aws_subnet.public_subnet-us-west-2b.id}"
user_data = "${file("userDataKafka")}"
tags {
    Name = "termnews-test"
  }
}
