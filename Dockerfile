#
# Rabbitmq server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"

# Update & install packages for rabbitmq
RUN apt-get update && \
    apt-get install -y rabbitmq-server

#Configure management plugin
RUN rabbitmq-plugins enable rabbitmq_management
RUN echo '[{rabbit, [{loopback_users, []}]}].' > /etc/rabbitmq/rabbitmq.config

EXPOSE 15672

#CMD ["rabbitmqctl", "start"]
CMD ["rabbitmq-server"]
