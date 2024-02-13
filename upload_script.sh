#!/bin/bash

REPOSITORY_URL="http://65.2.180.154:8081/repository/Battleship-repo/"  # Replace with your Nexus repository URL
NEXUS_USERNAME="admin"  # Replace with Nexus repository username
NEXUS_PASSWORD="nexus@123"  # Replace with Nexus repository password
TGZ_FILE="battleships.tgz"  # Path to the ZIP file to upload

# Authenticate with Nexus repository and upload ZIP file
curl -u "$NEXUS_USERNAME:$NEXUS_PASSWORD" -X POST "$REPOSITORY_URL" -H "accept: application/json" -H "Content-Type: multipart/form-data" -F "artifact=@$TGZ_FILE;type=application/gzip"
