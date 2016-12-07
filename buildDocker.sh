#!/bin/bash

# First clean previous build
echo "Cleaning..."
rm -rf ./build

if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

# Create a new build
echo "Building App"
npm run build

# If return code returns anything else than 0, the npm build failed
# and will exit with same rc number.
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi

# Use information for docker-compose
cat > ./build/githash.txt <<_EOF_
$GIT_COMMIT
_EOF_

# Copy Dockerfile to build
cp ./Dockerfile ./build/
cp ./package.json ./build/
cp ./fix.sh ./build/

cd build

echo "Building docker image"
# Building docker based on Dockerfile
#docker build -t arnheidur13/tictactoe:$GIT_COMMIT .
docker build -t arnheidur13/tictactoe .


rc=$?
if [[ $rc != 0 ]] ; then
   echo "Docker build failed" $rc
   exit $rc
fi

#docker-compose up
echo "Done"
