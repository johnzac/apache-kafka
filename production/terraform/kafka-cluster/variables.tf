
variable "amiServer"{
default="ami-9fa761e7"
}
variable "serversType"{
default="t2.micro"
}
variable "serversKeyName"{
default="mysql-key"
}
variable "serversUserDataFile"{
default="userDataKafka"
}
variable "zookeeperServersCount"{
default= 3
}
variable "kafkaBrokersCount"{
default= 3
}
variable "amiClient"{
default="ami-9fa761e7"
}
variable "clientNodeCount"{
default = 5
}
variable "clientsType"{
default="t2.micro"
}
variable "clientKeyName"{
default="mysql-key"
}
variable "clientsUserDataFile"{
default="userDataKafka"
}


