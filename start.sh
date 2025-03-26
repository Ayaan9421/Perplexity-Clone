#!/bin/bash
source server/venv/Scripts/activate
fastapi dev server/main.py --host 0.0.0.0 --port 8000
