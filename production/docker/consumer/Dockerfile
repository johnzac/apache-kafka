From alpine
RUN apk add --no-cache python2
RUN apk add --no-cache py-pip
RUN pip install flask
RUN pip install kafka-python
COPY python/* /home/consumer/
WORKDIR "/home/consumer"
EXPOSE 5000
CMD ["flask","run","--host=0.0.0.0"]

