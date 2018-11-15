# pull base image
FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "===> Adding Ansible's prerequisites..."   && \
    apt-get update -y            && \
    apt-get upgrade -y            && \
        apt-get install --no-install-recommends -y -q  \
                build-essential                        \
                python python-pip python-dev           \
                libffi-dev libssl-dev                  \
                libxml2-dev libxslt1-dev zlib1g-dev    \
                git && \
    python -m pip install --upgrade pip && \
    pip2 install --upgrade setuptools pip wheel      && \
    pip2 install --upgrade pyyaml jinja2 pycrypto    && \
    pip2 install --upgrade pywinrm                   && \
    pip2 install --upgrade pyvmomi                   && \
    pip2 install --upgrade ansible                   && \
    pip2 install --upgrade openstacksdk              && \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    apt-get install -y sshpass openssh-client  && \
    \
    echo "===> Clean up..."                                         && \
    apt-get remove -y --auto-remove \
            build-essential python-pip python-dev git libffi-dev libssl-dev  && \
    apt-get clean                                                   && \
    rm -rf /var/lib/apt/lists/*                                     && \
    \
    echo "===> Adding hosts for convenience..."  && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts


# ENV PATH        /opt/ansible/bin:$PATH
# ENV PYTHONPATH  /opt/ansible/lib:$PYTHONPATH
# ENV MANPATH     /opt/ansible/docs/man:$MANPATH

WORKDIR /work

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
