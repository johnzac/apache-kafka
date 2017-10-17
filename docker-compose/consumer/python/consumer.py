from kafka import KafkaConsumer
from flask import Flask
import time
app = Flask(__name__)
@app.route('/',methods=['GET'])
def getSections():
    while True:
        try:
            consumer = KafkaConsumer('test-topic4', bootstrap_servers=['kafka:9092'])
            break
        except Exception as err:
            time.sleep(2)
    for msg in consumer:
        sections=msg.value
        return sections
