#!/usr/bin/env bash

STACK_NAME="packer-demo"

aws cloudformation deploy --template-file pipeline/pipeline.yml \
    --stack-name ${STACK_NAME} --capabilities CAPABILITY_IAM &&
    aws cloudformation wait stack-create-complete --stack-name ${STACK_NAME} &&
    git clone $(aws cloudformation describe-stacks --stack-name ${STACK_NAME} \
    --query 'Stacks[0].Outputs[?OutputKey==`CloneUrlHttp`].OutputValue' \
    --output text) tmp && mv tmp/.git . && rm -fR tmp && git add * &&
    git commit -am "Initial Commit" && git push
