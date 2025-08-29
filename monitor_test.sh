#!/bin/bash

URL="https://simpleapp-1032571919249.asia-southeast2.run.app"

count=0;

echo "demo video"

trap 'echo -e "\nDone requesting\nRequests sent: ${count}"' EXIT

while true; do
  curl -s -o /dev/null -w "%{http_code}\n" "$URL"
  ((count++))
  sleep 1  
done


