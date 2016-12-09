#!/bin/bash

#This is potential fix for this problem:

#Stops if error is detected
set -e

#Wait for 10 seconds and try to get connection again
sleep 10

#Create migration
echo "Running migratedb...."
npm run migratedb
node run.js

exit 0

#use this script as CMD in your Dockerfile instead of node run.js = improve
