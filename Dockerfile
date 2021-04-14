FROM nginx

RUN apt-get -y update && \
    apt-get install  nano
