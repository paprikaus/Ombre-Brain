#!/bin/bash
grep -n "oauth_authorization_server\|oauth_register\|oauth/token" /opt/ombre-brain/src/server.py | head -20
echo "---"
wc -l /opt/ombre-brain/src/server.py
