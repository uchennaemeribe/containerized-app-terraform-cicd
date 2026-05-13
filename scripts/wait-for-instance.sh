#!/bin/bash

IP=$1

echo "Waiting for instance readiness..."

for i in {1..30}

do

  ssh -i ~/.ssh/aws_key_pair -o StrictHostKeyChecking=no azureuser@$IP "docker --version" && exit 0

  echo "Waiting for Docker installation..."

  sleep 15

done

echo "Instance failed readiness checks"

exit 1