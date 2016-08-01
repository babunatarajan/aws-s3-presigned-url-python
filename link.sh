#!/bin/bash

source "/root/.awslogin"

python -c "import boto"
ab=$?

if [ ! $ab = 0 ]; then
  echo "Python boto is missing please run following commands to install the same"
  echo "sudo apt-get update"
  echo "sudo apt-get install python-pip"
  echo "sudo pip install boto"
  exit 0
fi

if [ ! -e "/root/.awslogin" ]; then
  echo "AWS credential file is not accessible"
  exit 0
fi


python s3.py -f photo1.jpg --key "$aws_key" --secret "$aws_sec" --bucket "xxxx" --expires 2

