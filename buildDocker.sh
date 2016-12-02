#!/bin/bash

echo "Cleaning..."
rm -rf ./dist

echo "Building App"
npm run build

rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi

#cat > ./dist/githash.txt <<_EOF_
#$GIT_COMMIT
#_EOF_

#cp ./Dockerfile ./build/


#cd dist
#echo "Building docker image" 

#docker build -t arnheidur13/tictactoe

#rc=$?
#if [[ $rc != 0 ]] ; then
#   echo "Docker build failed" $rc
#   exit $rc
#fi

echo "Done"
