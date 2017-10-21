import boto.ec2,yaml,sys
with open("config-common.yml","r") as ymlfile:
    cfg= yaml.load(ymlfile)
awsConn = boto.ec2.connect_to_region(cfg['aws-configuration']['region'])
fil = {}
for tags in cfg['aws-configuration']['tags']['tags-kafkaCandidate']:
    tagName,tagValue=tags.items()[0]
    fil['tag:'+tagName] = tagValue
fil['instance-state-name'] = 'running'
reservations = awsConn.get_all_reservations(filters=fil)
instancesArray = [i for r in reservations for i in r.instances ]
kafkaBrokerCount=cfg['kafkaBrokerCount']
tagSetCount=0
for instance in instancesArray:
    if tagSetCount == kafkaBrokerCount:
        break
    for tags in cfg['aws-configuration']['tags']['tags-kafka']:
        tagName,tagValue=tags.items()[0]
        instance.add_tag(tagName,tagValue)
    tagSetCount+=1
    
