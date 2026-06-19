#!/bin/bash
# Watch recent access logs for OAuth-related requests
docker logs ombre-brain --since 5m 2>&1 | grep -v "heartbeat\|anchors\|errors/recent\|health\|httpx"
