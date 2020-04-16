FROM ubuntu

MAINTAINER aracloud <aracloud@gmx.net>

ENV SYSUSER ndee
ENV VMWFILE VMware-ovftool-4.3.0-7948156-lin.x86_64.bundle

COPY files/${VMWFILE} /tmp/

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
    apt install vim curl unzip jq -y && \
    cd /root/ && \
    curl -LO https://raw.github.com/robertpeteuil/terraform-installer/master/terraform-install.sh && \
    chmod +x terraform-install.sh && \
    ./terraform-install.sh && \
    adduser --disabled-password --gecos "" ndee && \
    mkdir /home/${SYSUSER}/gitrepo && \
    chown ${SYSUSER}.${SYSUSER} /home/${SYSUSER}/gitrepo && \
    sh /tmp/${VMWFILE} --console --required --eulas-agreed

