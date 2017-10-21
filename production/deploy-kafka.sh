#!/bin/bash
terraformDirectroy="/home/owl/instance-terraform"
botoDirectory="/home/owl/boto/testing"
ansibleDirectory="/home/owl/Desktop/playbooks"
echo "Bringing up infrastructure..."
cd $terraformDirectroy
terraform apply
echo "Creating ansible inventories and variables"
cd $botoDirectory
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



