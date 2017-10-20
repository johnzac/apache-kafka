#!/bin/bash
terraformDirectroy="/home/owl/instance-terraform"
botoDirectory="/home/owl/git-kafka/production/boto/production"
ansibleDirectory="/home/owl/Desktop/finaltestKafka"
echo "Bringing up infrastructure..."
cd $terraformDirectroy
terraform apply
echo "Creating ansible inventories and variables"
cd $botoDirectory
python getInstances-server.py
python getInstances-kafka.py
python getInstances-client.py
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



