#!/bin/bash

# First clean previous build
echo "Cleaning..."
rm -rf ./build

# Retrieve githash of new commit
if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

# Fix for Jenkins - still testing
npm install --silent
cd client
npm install --silent
cd ..

# Create a new build
echo "Building App"
npm run build

# Displays error is npm build failes
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi

# Storing githash in text file while running
cat > ./build/githash.txt <<_EOF_
$GIT_COMMIT
_EOF_

# Put githash in .env file that docker-compose uses for latest image
cat > ./build/.env << _EOF_
GIT_COMMIT=$GIT_COMMIT
_EOF_

# Copy files to build directory
cp ./Dockerfile ./build/
cp ./fix.sh ./build/
cp ./package.json ./build/
cp ./docker-compose.yml ./build/

# Go to build directory
cd build

# And start building docker image 
echo "Building docker image"
docker build -t arnheidur13/tictactoe:$GIT_COMMIT .
#docker build -t arnheidur13/tictactoe .

# Display error message if build failed
rc=$?
if [[ $rc != 0 ]] ; then
   echo "Docker build failed" $rc
   exit $rc
	fi

# Push image to Docker Hub
docker push arnheidur13/tictactoe:$GIT_COMMIT

# Displays this error message if push failed
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker push failed " $rc
    exit $rc
fi

# After "Done" -> cd build -> docker-compose up (for some reason)

echo "Done"
