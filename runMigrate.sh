#!/bin/bash

set -e
#Wait for 10 seconds and try to get connection again
sleep 10

#Create migration
npm run migratedb
node run.js

exit 0

#use this script as CMD in your Dockerfile instead of node run.js = improve

