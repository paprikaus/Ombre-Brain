#!/bin/bash
set -e

PROJ_DIR=/opt/ombre-brain

echo "=== Stopping old container ==="
docker stop ombre-brain || true
docker rm ombre-brain || true

echo "=== Backing up config and data ==="
cp $PROJ_DIR/config.yaml /tmp/config.yaml.bak

echo "=== Pulling new code ==="
cd $PROJ_DIR

# If git not initialized, clone fresh; otherwise pull
if [ ! -d .git ]; then
    cd /opt
    rm -rf ombre-brain-old
    mv ombre-brain ombre-brain-old
    git clone -b obtestmain https://github.com/P0luz/OB-Test.git ombre-brain
    # Restore config and data
    cp /tmp/config.yaml.bak /opt/ombre-brain/config.yaml
    mv /opt/ombre-brain-old/data /opt/ombre-brain/data 2>/dev/null || true
else
    git pull origin obtestmain
fi

cd $PROJ_DIR

echo "=== Current config.yaml ==="
cat config.yaml | head -20

echo "=== Rebuilding image ==="
docker build -t ombre-brain:local .

echo "=== Starting new container ==="
docker compose up -d

echo "=== Done ==="
docker ps | grep ombre-brain
