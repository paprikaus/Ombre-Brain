#!/bin/bash
docker exec ombre-brain python3 -c "from starlette.middleware.base import BaseHTTPMiddleware; print('import OK')"
