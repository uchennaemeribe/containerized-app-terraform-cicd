#!/bin/bash

INSTANCE_IP=$1

echo "======================================="
echo "WAITING FOR EC2 INSTANCE INITIALIZATION"
echo "======================================="

SUCCESS=false

for i in {1..30}
do

  echo "Attempt $i of 30"

  ssh -i ~/.ssh/aws_key_pair \
    -o StrictHostKeyChecking=no \
    -o ConnectTimeout=10 \
    ubuntu@$INSTANCE_IP \
    "docker --version" && SUCCESS=true && break

  echo "Docker not ready yet..."

  sleep 10
done

if [ "$SUCCESS" != "true" ]; then

  echo "======================================="
  echo "INSTANCE INITIALIZATION FAILED"
  echo "======================================="

  exit 1
fi

echo "======================================="
echo "INSTANCE IS READY"
echo "======================================="