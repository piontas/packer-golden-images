#!/usr/bin/env bash

if [ -z "$1" ]
  then
    echo "No argument supplied"
    exit 1
fi

export SUBSCRIPTION_ID=$(az account show | jq -r '.id')
export CLIENT_ID=$(az ad app list | jq -r '.[] | select(.displayName == "Packer") | .appId')
export TENANT_ID=$(az account show | jq -r '.tenantId')
export OBJECT_ID=$(az ad sp list | jq -r '.[] | select(.displayName == "Packer") | .objectId')

packer build -var-file="packer/${1}.parameters.json" packer/${1}.json
