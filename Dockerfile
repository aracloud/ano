FROM ubuntu

MAINTAINER aracloud <aracloud@gmx.net>

RUN apt update && \
    apt install git -y  && \
    apt install python-pip -y && \
    pip install --upgrade pip && \
    pip install setuptools && \
    pip install paramiko && \
    pip install ansible ansible-lint ansible-review && \
    pip install bigsuds f5-sdk && \
    pip install pyopenssl && \
    pip install netaddr deepdiff && \
    pip install pyvmomi && \
    apt install vim curl -y && \
    adduser --disabled-password --gecos "" ndee
