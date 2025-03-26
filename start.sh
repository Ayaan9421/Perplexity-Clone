#!/bin/bash
# Ensure dependencies are installed
pip install --no-cache-dir -r server/requirements.txt

# Start FastAPI with the correct port
fastapi dev server/main.py --host 0.0.0.0 --port $PORT
