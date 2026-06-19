#!/bin/bash
rsync -az \
  --exclude='.git' \
  --exclude='tmp/' \
  --exclude='data/' \
  --exclude='config.yaml' \
  --exclude='__pycache__' \
  --exclude='*.pyc' \
  -e "sshpass -p 'Tsu427173' ssh -o StrictHostKeyChecking=no" \
  /mnt/p/OB/OB-Test/ \
  root@129.146.23.82:/opt/ombre-brain/
echo "rsync exit: $?"
