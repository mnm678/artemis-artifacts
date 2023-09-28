#!/bin/bash

# Start the Python HTTP server in the background
cd registry
python -m http.server 8001 &
cd ..

# Store the process ID of the HTTP server
http_server_pid=$!

# Start your Python script
time python3 without-artemis-download.py

# Measure storage
du -shA local-repository/updater/metadata/current

# Stop the HTTP server
kill $http_server_pid

