

variable "amiServer"{
default="ami-9fa761e7"
}
variable "serversType"{
default="t2.micro"
}
variable "serversKeyName"{
default="keypair-kafka"
}
variable "serversUserDataFile"{
default="userDataKafka"
}
variable "zookeeperServersCount"{
default= 3
}
variable "amiClient"{
default="ami-9fa761e7"
}
variable "clientNodeCount"{
default = 2
}
variable "clientsType"{
default="t2.micro"
}
variable "clientKeyName"{
default="keypair-kafka"
}
variable "clientsUserDataFile"{
default="userDataProxy"
}
variable "public_subnet_availabilityzone_a"{
default="us-west-2a"
}
variable "public_subnet_availabilityzone_b"{
default="us-west-2b"
}


