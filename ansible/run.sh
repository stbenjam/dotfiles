#!/bin/bash
mkdir -p roles
ansible-galaxy install --roles-path roles -r requirements.yml --force
ansible-playbook -i "localhost," -c local stephen.yml
