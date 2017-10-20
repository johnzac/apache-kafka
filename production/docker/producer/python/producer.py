from kafka import SimpleProducer, KafkaClient
import time
while True:
    try:
        kafka = KafkaClient('kafka:9093')
        break
    except Exception as err:
        time.sleep(2)
        print("still trying")
producer = SimpleProducer(kafka)
topic = 'test-topic4'
message="This is a test"
print(' emitting.....')
while True:
    try:
        while True:
            producer.send_messages(topic, message)
            print('done emitting')
            time.sleep(2)
        break
    except Exception as err:
        time.sleep(2)
        print("trying to emit")


