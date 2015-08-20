#!/bin/sh
sudo easy_install pip
sudo pip install paramiko PyYAML Jinja2 httplib2 six
sudo pip install ansible

#run ansible
ansible-playbook -i local work_environment.yml --ask-sudo-pass
