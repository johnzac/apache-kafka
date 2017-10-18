resource "aws_security_group" "public-sg"
{
name="public-security-group"
description="Security group for publicly accessible instances"
vpc_id="${aws_vpc.demoAppVpc.id}"

}


resource "aws_security_group_rule" "allow-access-ssh"
{
  type            = "ingress"
  from_port       = 22
  to_port         = 22
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.public-sg.id}"
}

resource "aws_security_group_rule" "allow-all-zookeeper"
{
  type            = "ingress"
  from_port       = 2888
  to_port         = 2888
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.public-sg.id}"
}
resource "aws_security_group_rule" "allow-all-zookeeper-leader"
{
  type            = "ingress"
  from_port       = 3888
  to_port         = 3888
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
  
  security_group_id = "${aws_security_group.public-sg.id}"
}

resource "aws_security_group_rule" "allow-all-kafka-node"
{
  type            = "ingress"
  from_port       = 9092
  to_port         = 9092
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.public-sg.id}"
}

resource "aws_security_group_rule" "allow-all-outbound"
{
  type            = "egress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks     = ["0.0.0.0/0"]

  security_group_id = "${aws_security_group.public-sg.id}"
}



