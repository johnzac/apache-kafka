#!/bin/bash
kafkaBrokerCount="3"
terraformDirectroy="/home/owl/git-kafka/production/terraform/kafka-cluster"
botoDirectory="/home/owl/git-kafka/production/boto/production"
ansibleDirectory="/home/owl/git-kafka/production/ansible/playbooks"
sed -i "s/kafkaBrokerCount:.*/kafkaBrokerCount: $kafkaBrokerCount/g" ${botoDirectory}/config-common.yml
echo "Bringing up infrastructure..."
cd $terraformDirectroy
terraform apply
sleep 5
cd $botoDirectory
echo "Adding tags to kafka instances"
python tagKafkaInstances.py
echo "Creating ansible inventories and variables"
python getInstances-server.py
python getInstances-kafka.py
python getInstances-client.py
echo "Running a 10 second sleep for the infrastructure to be ready"
sleep 10
echo "Running playbooks..."
cd $ansibleDirectory
echo "Running zookeeper role"
ansible-playbook playbookzookeeper.yml -i zookeeper
echo "Running kafka broker role"
ansible-playbook playbookKafka.yml -i kafka
echo "Running client role"
ansible-playbook playbookClient.yml -i client
echo "Running testing role"
ansible-playbook playbookTesting.yml -i client



