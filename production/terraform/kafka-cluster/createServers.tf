resource "aws_instance" "zookeeperServers"
{
ami = "${var.amiServer}"
instance_type = "${var.serversType}"
count = "${var.zookeeperServersCount}"
vpc_security_group_ids = ["${aws_security_group.public-sg.id}"]
key_name = "${var.serversKeyName}"
subnet_id="${aws_subnet.public_subnet-us-west-2b.id}"
user_data = "${file(var.serversUserDataFile)}"
tags {
    kafka-prod-server = "true"

    zookeeper-prod-server = "true"
  }
}
