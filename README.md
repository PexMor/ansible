# Ansible docker image

Fixed Ansible docker for github docker runner

# Get or update the docker image

Apart from ansible itself (version shown by the command below) it contains also
**openstacksdk** and **pyvmomi**. Those modules enables the control of
**ESXi** and/or **Openstack** (including VMWare Integrated Openstack aka VIO).

```bash
docker pull xlinux/ansible
```

# Use the image

Elementary use or test the ansible. The command below also removes the container R/W layer after execution.

```bash
docker run -it --rm xlinux/ansible
```

Real use-case would probably look like this:

```bash
docker run -it --rm \
    --name ansible \
    -v $PWD:/work \
    -v $HOME/.docker-ansible/etc:/etc/ansible \
    -v $HOME/.docker-ansible/os:/etc/openstack \
    xlinux/ansible
    /work/playbook.yaml
```

# Docker hub

You can check the image at Docker hub as [xlinux/ansible](https://hub.docker.com/r/xlinux/ansible).

