FROM nginx:alpine

RUN echo 'root:T00r' | chpasswd \
    && apk update \
    && apk add openssh openrc \
    && rc-update add sshd \
    && rc-status \
    && touch /run/openrc/softlevel \
    && rc-service sshd restart \
    && mkdir /root/.ssh \
    && touch /root/.ssh/authorized_keys