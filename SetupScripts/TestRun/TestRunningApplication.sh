#!/bin/bash

read -p "Enter API KEY: " -s API
docker build --build-arg TMB_V3_API_KEY=$API -t netflix ../../.

echo "Image is Created."
echo 
echo "Running Image..."
docker run -d -p 8081:80 netflix
echo
echo "Application is running on Port : 8081"