FROM ubuntu:latest
RUN apt update
RUN apt-get update
RUN apt-get install -y sudo  
RUN apt-get install -y software-properties-common 
RUN apt-get install -y git 
RUN apt-get install -y python3-pip
RUN pip3 install ansible

ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache

RUN useradd -ms /bin/bash ubuntu
USER ubuntu
WORKDIR /home/ubuntu
RUN git clone -b dockerfix https://github.com/ocelotdata/devtools.git /home/ubuntu/devtools/
RUN echo 'root:docker' | chpasswd
RUN ansible-playbook /home/ubuntu/devtools/iac/playbooks/main.yaml -vvv --ask-become-pass
