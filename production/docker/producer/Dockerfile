From alpine
RUN apk add --no-cache python2
RUN apk add --no-cache py-pip
RUN pip install kafka-python
COPY python/* /home/producer/
WORKDIR "/home/producer"
CMD ["python","/home/producer/producer.py"]

