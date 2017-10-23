resource "aws_instance" "clientServers"
{
ami = "${var.amiClient}"
instance_type = "${var.clientsType}"
count = "${var.clientNodeCount}"
vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
key_name = "${var.clientKeyName}"
subnet_id="${aws_subnet.public_subnet-us-west-2b.id}"
user_data = "${file(var.clientsUserDataFile)}"
tags {

    client-node = "true"
    kafka-candidate = "true"
  }
}
