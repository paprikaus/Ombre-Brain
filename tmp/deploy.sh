#!/bin/bash
# Run on remote server to deploy new ombre-brain

set -e

echo "=== Current state ==="
docker ps -a | grep ombre-brain || true
docker images | grep ombre-brain || true

echo "=== Checking for existing project dir ==="
ls /opt/ombre-brain 2>/dev/null || echo "not found"
ls /root/ombre-brain 2>/dev/null || echo "not found"

echo "=== Docker inspect binds ==="
docker inspect ombre-brain 2>/dev/null | python3 -c "
import sys,json
d=json.load(sys.stdin)
if d:
    c=d[0]
    print('Binds:', c.get('HostConfig',{}).get('Binds'))
    print('Env:', [e for e in c.get('Config',{}).get('Env',[]) if 'OMBRE' in e])
" || true

echo "=== Git remote ==="
git -C /opt/ombre-brain remote -v 2>/dev/null || git -C /root/ombre-brain remote -v 2>/dev/null || echo "no git repo found"
