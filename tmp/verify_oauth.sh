#!/bin/bash
echo "=== OAuth discovery ==="
curl -s http://127.0.0.1:18001/.well-known/oauth-authorization-server
echo ""
echo "=== MCP without token (expect 401) ==="
curl -s -o /dev/null -w "%{http_code}" http://127.0.0.1:18001/mcp
echo ""
echo "=== OAuth authorize page ==="
curl -s -o /dev/null -w "%{http_code}" "http://127.0.0.1:18001/oauth/authorize?client_id=test&redirect_uri=http://localhost&state=s&code_challenge=abc"
echo ""
