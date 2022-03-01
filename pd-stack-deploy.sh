#!/bin/bash

STACK_NAME=$1

if [ -z "$1" ]
  then
    echo "No STACK_NAME argument supplied"
    exit 1
fi

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Creating stack..."
aws cloudformation create-stack \
  --stack-name ${STACK_NAME} \
  --template-body file://${DIR}/PresidioTemplate.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters file://${DIR}/PresidioParameters.json \
  --tags file://${DIR}/PresidioTags.json \


#testing changes