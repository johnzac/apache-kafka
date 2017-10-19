import boto.ec2,yaml,sys
with open("config-server.yml","r") as ymlfile:
    cfg= yaml.load(ymlfile)
ansible_user = cfg['aws-configuration']['ansible_ssh_user']
ansible_user_ssh_key_file = cfg['aws-configuration']['ansible_ssh_private_key_file']
fil = {}
awsConn = boto.ec2.connect_to_region(cfg['aws-configuration']['region'])
for tags in cfg['aws-configuration']['tags']:
    tagName,tagValue=tags.items()[0]
    fil['tag:'+tagName] = tagValue
fil['instance-state-name'] = 'running'
reservations = awsConn.get_all_reservations(filters=fil)
instancesArray = [i for r in reservations for i in r.instances ]
ansible = open(cfg['ansible-inventory-filename'], 'w')
zookeeper = open(cfg['ansible-zookeeper-var-filename'],'w')
ansible.write("[" + cfg["ansible-host"] + "]\n")
zookeeper.write("zooKeeperServers:\n")
instanceVar = str(1)
for instance in instancesArray:
    print(instance.ip_address)
    print(instance.private_ip_address)
    ansible.write(instance.ip_address + " ansible_user=" + ansible_user + " ansible_ssh_private_key_file=" + ansible_user_ssh_key_file + " hostZooKeeperId=" + instanceVar + " hostBrokerId=" + str(instanceVar) + " hostAdvertiseIp=" + instance.private_ip_address + "\n")
    zookeeper.write("    - " + instance.private_ip_address + "\n")
    instanceVar= str(int(instanceVar) + 1)
    
ansible.close
zookeeper.close
