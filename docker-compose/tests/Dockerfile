From alpine
RUN apk add --no-cache bash
RUN apk add --no-cache curl
COPY bash/* /home/tests/
WORKDIR "/home/tests"
CMD ["/bin/bash","test.sh"]

