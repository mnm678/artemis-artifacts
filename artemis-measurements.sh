#!/bin/bash

# Start the Python HTTP server in the background
cd registry
python -m http.server 8001 &
cd ..

# Store the process ID of the HTTP server
http_server_pid=$!

cd test_repository1
python -m http.server 8002 &
cd ..

http_server_pid2=$!

# Start your Python script
time python3 artemis-download.py

# Measure storage
du -shA local-repository/registry/metadata/current
du -shA local-repository/test_repository1/metadata/current

# Stop the HTTP server
kill $http_server_pid
kill $http_server_pid2
