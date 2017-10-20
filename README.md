# apache-kafka
Code to bring up apache kafka on a set of nodes.
Provisions a number of nodes on an aws vpc using terraform, creates ansible inventory files and variable files to be generated based on the output using python boto library and sets up kafka cluster using ansible.

The script uses upstart scripts to respawn kafka and zookeeper on failure and bring them up on system reboots, so it will not work on debian based distros that have migrated to systemd. Tested on ubuntu 14.04 instances and the default ami in terraform config is of ubuntu 14.04 in us-west-2 region. Service discovery on the client nodes is done using a combination of haproxy and Dnsmasquerade, so the clients can connect with a DNS name( 'kafka' is configured as default) and port( Configured to 9093 by default). HAproxy will proxy the requests to the kafka brokers. 

Script tested on ubuntu 14.04 host system with terraform 0.9.11, Python 2.7.6 and ansible 2.3.2.
To run the script , you will need terraform, python and ansible installed on the system. Boto python library will also need to be installed. Any version of ansible and terraform should work fine. Boto is known not to play very well with python3, so, I'd recommend trying it out on python2.

Configuration files:
You'll have to edit the following config files:
edit terraformDirectroy,botoDirectory and ansibleDirectory in deploy-kafka.sh to the corresponding ones on your local system.
For boto, you will have to edit ansibleDirectory, aws region, aws user( ansible_ssh_user), private key and inventory filenames in config-client,config-kafka and config-server yml files ( Each service is handled independently).
Edit terrafrom configuration.tf with your aws access and secret keys.
The rest should work with the defaults.
The tweakable configuration parameters for each service is in it's corresponding ansible role vars file.

To run the script, modify the config files and run the deploy-kafka.sh shell script.

Known Bugs:
Needs to be configured with a minimum of 3 kafka brokers and 3 zookeeper servers. While the latter is essential for proper functioning of zookeeper, the former is a bug. 


