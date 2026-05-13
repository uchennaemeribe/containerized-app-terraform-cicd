# ==========================================================
# FILE: scripts/wait-for-instance.sh
# PURPOSE:
# Wait For EC2 Initialization + Docker Readiness
#
# FEATURES:
# - SSH connectivity validation
# - Docker readiness verification
# - Automated retry mechanism
# ==========================================================

#!/bin/bash

INSTANCE_IP=$1

echo "Waiting for instance readiness..."

for i in {1..30}
do
  ssh -i ~/.ssh/aws_key_pair \
    -o StrictHostKeyChecking=no \
    -o ConnectTimeout=10 \
    ubuntu@$INSTANCE_IP \
    "docker --version" && break

  echo "Waiting for Docker installation..."
  sleep 10
done