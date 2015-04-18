FROM centos:6
MAINTAINER David Lyle

RUN yum remove -y iptables
RUN yum update -y
RUN yum install -y tar ntp wget openssh-clients openssh-server
RUN mkdir .ssh
RUN ssh-keygen -f ~/.ssh/id_rsa -t rsa -N ''
RUN cat ~/.ssh/id_rsa >> ~/.ssh/authorized_keys
RUN ssh-keyscan localhost >> ~/.ssh/known_hosts
RUN ssh-keyscan $(hostname -f)  >> ~/.ssh/known_hosts
