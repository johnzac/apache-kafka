resource "aws_instance" "clientServersKafka"
{
ami = "${var.amiClient}"
instance_type = "${var.clientsType}"
count = "${var.kafkaBrokersCount - var.zookeeperServersCount}"
vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
key_name = "${var.clientKeyName}"
subnet_id="${aws_subnet.public_subnet-us-west-2b.id}"
user_data = "${file(var.clientsUserDataFile)}"
tags {
    kafka-prod-server = "true"

    client-node = "true"
  }
}


resource "aws_instance" "clientServers"
{
ami = "${var.amiClient}"
instance_type = "${var.clientsType}"
count = "${var.clientNodeCount - var.kafkaBrokersCount}"
vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
key_name = "${var.clientKeyName}"
subnet_id="${aws_subnet.public_subnet-us-west-2b.id}"
user_data = "${file(var.clientsUserDataFile)}"
tags {

    client-node = "true"
  }
}
