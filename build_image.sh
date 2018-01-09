#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

export SECURE_IP="$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}')/32"

packer build -var-file="packer/${1}.parameters.json" packer/${1}.json
