#!/bin/bash

#This is potential fix for this problem:

set -e

sleep 10
npm run migratedb
node run.js

exit 0

#use this script as CMD in your Dockerfile instead of node run.js = improve
